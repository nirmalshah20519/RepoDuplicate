// See https://aka.ms/new-console-template for more information
Console.WriteLine("Enter Your Name : ");
string name = Console.ReadLine();
char[] vowels = { 'a', 'e', 'i', 'o', 'u' };
int vowelCount = 0;
foreach (var item in name)
{
    if (vowels.Contains(Char.ToLower(item))){
        vowelCount++;
    }
}
Console.WriteLine($"{name} contains {vowelCount} vowels");