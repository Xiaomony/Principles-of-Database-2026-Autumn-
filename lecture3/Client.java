
public class Client {

    public static void main(String[] args) {
        try {
            DataManipulation dm = new DataFactory().createDataManipulation(args[0]);
            // dm.addOneMovie("流浪地球;cn;2019;127");
            System.out.println(dm.allContinentNames());
            System.out.println(dm.continentsWithCountryCount());
            // System.out.println(dm.findMovieById(10));

            // System.out.println("========= normal query (statement) =========");
            // System.out.println(dm.findMoviesByTitleLimited10_statement("'aba'"));
            // System.out.println("========= injection query (statement) =========");
            // System.out.println(dm.findMoviesByTitleLimited10_statement("'aba'; drop table movies;--"));

            System.out.println("========= normal query (prestatement) =========");
            System.out.println(dm.findMoviesByTitleLimited10_prestatement("aba"));
            // System.out.println("========= injection query (prestatement) =========");
            // System.out.println(dm.findMoviesByTitleLimited10_prestatement("'aba'; drop table movies;--"));
        } catch (IllegalArgumentException e) {
            System.err.println(e.getMessage());
        }
    }
}
