#include <chrono>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <fstream>
#include <iostream>
#include <ranges>
#include <string>
#include <string_view>
#include <vector>

struct Movie {
    size_t id;
    uint32_t release_year, runtime;
    size_t movie_name_len;
    char country_code[2], name[100]{};
};

constexpr char delimiter{'|'};
using LoadedData = std::vector<std::vector<std::string>>;

LoadedData load_data(const char *file_name) {
    std::ifstream f{file_name};
    std::string line;
    LoadedData data;
    while (std::getline(f, line)) {
        std::vector<std::string> line_data;
        size_t start{0}, pos;
        while ((pos = line.find(delimiter, start)) != std::string::npos) {
            line_data.push_back(line.substr(start, pos - start));
            start = pos + 1;
        }
        line_data.push_back(start > line.size() + 1 ? "" : line.substr(start));
        data.push_back(line_data);
    }
    return data;
}

auto contain_query(const LoadedData &data, const std::string_view key, const size_t column) {
    using std::string;
    uint32_t count{0};
    for (auto &x : data) {
        auto &t{x[column]};
        if (t.find(key) != string::npos) {
            count++;
            // for (auto k : x)
            //     std::cout << k << "\t|  ";
            // std::cout << std::endl;
        }
    }
    return count;
}

void update(LoadedData &data, const size_t column, const std::string_view from, const std::string_view to) {
    const size_t from_size{from.size()};
    for (auto &x : data) {
        auto &t{x[column]};
        size_t pos, start{0};
        while ((pos = t.find(from, start)) != std::string::npos) {
            t.replace(pos, pos + from_size, to);
            start = pos + from_size;
        }
    }
}

void write_data(LoadedData &data, const char *file_name) {
    std::ofstream f{file_name};
    for (auto &x : data) {
        for (int i{0}; i < x.size() - 1; i++)
            f << x[i] << '|';
        f << x.back() << std::endl;
    }
}

std::vector<Movie> convert_movie_data_to_binary(LoadedData &data) {
    auto mapped{data | std::ranges::views::transform([](std::vector<std::string> &x) {
                    auto y = Movie{
                        std::stoul(x[0]),
                        static_cast<uint32_t>(std::stoul(x[3])),
                        x[4].empty() ? 0 : static_cast<uint32_t>(std::stoul(x[4])),
                        x[1].length(),
                    };
                    std::memcpy(y.country_code, x[2].c_str(), 2);
                    std::memcpy(y.name, x[1].c_str(), x[1].length());
                    return y;
                })};
    return std::vector<Movie>{mapped.begin(), mapped.end()};
}

void write_binary_data(std::vector<Movie> &data, const char *file_name) {
    std::ofstream f{file_name, std::ios::binary};
    const std::uint64_t count = data.size();
    f.write(reinterpret_cast<const char *>(&count), sizeof(count));
    f.write(reinterpret_cast<const char *>(data.data()), static_cast<std::streamsize>(data.size() * sizeof(Movie)));
}

std::vector<Movie> read_binary_data(const char *file_name) {
    std::ifstream f{file_name, std::ios::binary};
    uint64_t count;
    f.read(reinterpret_cast<char *>(&count), sizeof(count));
    std::vector<Movie> data(count);
    f.read(reinterpret_cast<char *>(data.data()), static_cast<std::streamsize>(count * sizeof(Movie)));
    return data;
}

LoadedData convert_binary_to_movie_data(const std::vector<Movie> &data) {
    auto mapped{data | std::ranges::views::transform([](const Movie &x) {
                    return std::vector<std::string>{std::to_string(x.id), std::string{x.name, x.movie_name_len},
                                                    std::string{x.country_code, 2}, std::to_string(x.release_year),
                                                    x.runtime ? std::to_string(x.runtime) : ""};
                })};
    return LoadedData{mapped.begin(), mapped.end()};
}

void time_counting(const bool is_start, const std::string_view prompt = "") {
    using namespace std::chrono;
    static time_point<steady_clock> ts, te;
    if (is_start)
        ts = steady_clock::now();
    else {
        te = steady_clock::now();
        std::cout << prompt << ":\t" << duration<double, std::milli>(te - ts).count() << " ms\n";
    };
}

int main(int argc, char *argv[]) {
    std::cout << "=======================Query Movie Data=======================\n";
    // load movie data
    time_counting(true);
    auto movie_data{load_data("./res/movies.txt")};
    time_counting(false, "load movie data");
    // query
    time_counting(true);
    std::cout << "There're " << contain_query(movie_data, "All ", 1) << " movies cotaining \"All\" in their title.\n";
    time_counting(false, "query word \"All\"");

    std::cout << "\n=======================Update People Data=======================\n";
    // load people data
    time_counting(true);
    auto people_data{load_data("./res/people.txt")};
    time_counting(false, "load people data");
    // update
    time_counting(true);
    update(people_data, 1, "T", "Ttt");
    update(people_data, 2, "T", "Ttt");
    time_counting(false, "update people data");
    // write people data
    time_counting(true);
    write_data(people_data, "./res/people_updated.txt");
    time_counting(false, "write people data");

    std::cout << "\n=======================Binary Storage Testing=======================\n";
    // convert movie data to binary form
    time_counting(true);
    auto binary_movie_data{convert_movie_data_to_binary(movie_data)};
    time_counting(false, "convert movie data to binary form");
    // write binary movie data to file
    time_counting(true);
    write_binary_data(binary_movie_data, "./res/movies.binary");
    time_counting(false, "write binary movie data to file");
    // read binary movie data
    time_counting(true);
    auto loaded_binary_data{read_binary_data("./res/movies.binary")};
    time_counting(false, "read binary movie data");
    // convert binary data to text form
    time_counting(true);
    auto restored_movie_data{convert_binary_to_movie_data(loaded_binary_data)};
    time_counting(false, "convert binary data to text form");

    return 0;
}
