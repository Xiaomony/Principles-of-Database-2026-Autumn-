#include <chrono>
#include <cstddef>
#include <fstream>
#include <iostream>
#include <string>
#include <string_view>
#include <vector>

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

void contain_query(const LoadedData &data, const std::string_view key, const size_t column) {
    using std::string;
    for (auto &x : data) {
        auto &t{x[column]};
        if (t.find(key) != string::npos) {
            for (auto k : x)
                std::cout << k << "\t|  ";
            std::cout << std::endl;
        }
    }
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
    // load movie data
    time_counting(true);
    auto movie_data{load_data("./movies.txt")};
    time_counting(false, "load movie data");

    // query
    time_counting(true);
    contain_query(movie_data, "All ", 1);
    time_counting(false, "query word \"All\"");

    // load people data
    time_counting(true);
    auto people_data{load_data("./people.txt")};
    time_counting(false, "load people data");

    // update
    time_counting(true);
    update(people_data, 1, "T", "Ttt");
    update(people_data, 2, "T", "Ttt");
    time_counting(false, "update people data");

    // update
    time_counting(true);
    write_data(people_data, "./people_updated.txt");
    time_counting(false, "write people data");

    return 0;
}
