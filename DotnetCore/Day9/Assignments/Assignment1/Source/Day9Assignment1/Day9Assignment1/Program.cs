using System.Text.Json;

namespace Day9Assignment1
{
    class Det
    {
        public string DirectorName { get; set; }
        public List<string> ActorsNames { get; set; }
        public string VideoLink { get; set; }
        public override string ToString()
        {
            var str = DirectorName + '\n';
            foreach (var item in ActorsNames)
            {
                str += item + '\n';
            }
            str += VideoLink;
            return str;
        }

    }
    class Movie
    {
        public int MovieID { get; set; }
        public string MovieName { get; set;}
        public Det Details { get; set; }
        public override string ToString()
        {
            string str = MovieID.ToString() + '\n';
            str += MovieName + '\n';
            str += Details.ToString();
            return str;

        }
    }
    internal class Program
    {
        public List<Movie> list = new List<Movie>();
        void getMoviesFromDirctor()
        {
            Console.Write("Enter Director Name : ");
            var dir=Console.ReadLine();
            var res=list.Where(x=>x.Details.DirectorName==dir).ToList();
            if(res!=null){
                Console.WriteLine($"Movie/s by Mr. {dir} are :");
                Console.WriteLine("");
                foreach (var item in res)
                {
                    Console.WriteLine(item.MovieName);
                }
                Console.WriteLine("");
                Console.WriteLine("");
            }
            else
            {
                Console.WriteLine($"No Movies of {dir} found");
            }
        }
        void getActorsFromMovie()
        {
            Console.Write("Enter Movie Name : ");
            var movie = Console.ReadLine();
            var res = list.FirstOrDefault(m => m.MovieName == movie);
            if (res!=null)
            {
                Console.WriteLine($"Actors of {movie} are :");
                Console.WriteLine("");
                foreach (var actor in res.Details.ActorsNames)
                {
                    Console.WriteLine(actor);
                }
                Console.WriteLine("");
                Console.WriteLine("");
            }
            else
            {
                Console.WriteLine("Movie Not Found");
            }
            
        }

        void getMovieWithSameDirectorandActor()
        {
            var res = list.Where(x => x.Details.ActorsNames.Contains(x.Details.DirectorName)).ToList();
            if(res!=null)
            {
                Console.WriteLine("");
                Console.WriteLine("");
                foreach (var item in res)
                {
                    Console.WriteLine(item.MovieName);
                }
            }
            else
            {
                Console.WriteLine("No Movie Found With Same Actor and Director");
            }
        }
        static void Main(string[] args)
        {
            Program program = new Program();
            string filepath = @"D:\RxTaskRepository\2717-Nirmal.S-Feb23Dotnet\DotnetCore\Day9\Assignments\Assignment1\Source\Day9Assignment1\Day9Assignment1\Movies.json";
            FileStream fs = new(filepath, FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            string msg = sr.ReadToEnd();
            Console.WriteLine(msg);
            program.list =JsonSerializer.Deserialize<List<Movie>>(msg);
            
            while (true)
            {
                Console.WriteLine("");
                Console.WriteLine("");
                Console.WriteLine("###");
                Console.WriteLine("1. Get Movie From Director Name");
                Console.WriteLine("2. Get Actor Names From Movie Name");
                Console.WriteLine("3. Get Movies Where Actor is working as director");
                Console.WriteLine("4. Exit");
                Console.WriteLine("");
                Console.Write("Enter Choice : ");
                int ch= Convert.ToInt32(Console.ReadLine());
                switch(ch)
                {
                    case 1: program.getMoviesFromDirctor();
                        break;
                    case 2: program.getActorsFromMovie();
                        break;
                    case 3: program.getMovieWithSameDirectorandActor();
                        break;
                    case 4: Environment.Exit(0);
                        break;
                }
            }
        }
    }
}


//{
//    "MovieID": 1,
//    "MovieName": "Pathan",
//    "Details": {
//        "DirectorName": "Sidharth Anand",
//      "ActorsNames": [
//        "Shahrukh Khan",
//        "Deepika Padukone",
//        "John Abraham"
//      ],
//      "VideoLink": "https://tutorial.radixind.in/videos/Pathaan.mp4"
//    }
//}