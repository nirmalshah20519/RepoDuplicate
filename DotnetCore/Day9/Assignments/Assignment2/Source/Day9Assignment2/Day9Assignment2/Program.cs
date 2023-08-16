using System.IO;

namespace Day9Assignment2
{
    internal class Program
    {
        void PrintData(DirectoryInfo dirInfo, int num)
        {
            DirectoryInfo[] dirData = dirInfo.GetDirectories();
            FileInfo[] fileData = dirInfo.GetFiles();
            var str = new string(' ', num * 4);
            foreach (var item in dirData)
            {
                Console.WriteLine(str + item.Name + '\n');
                PrintData(item, num+1);
            }
            foreach (var file in fileData)
            {
                Console.WriteLine(str + file.Name);
            }
            Console.WriteLine("");
        }
        static void Main(string[] args)
        {
            Program program = new Program();
            DirectoryInfo dInfo = new DirectoryInfo(@"D:\RxTaskRepository\2717-Nirmal.S-Feb23Dotnet");
            program.PrintData(dInfo, 0);

        }
    }
}