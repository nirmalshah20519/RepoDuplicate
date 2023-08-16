// See https://aka.ms/new-console-template for more information
Console.WriteLine("Enter a Number :");
int num = Convert.ToInt32(Console.ReadLine());
int sum = 0;
for(int i = 0; i <= num; i++)
{
    if (i % 2 == 0)
    {
        sum += i;
    }
}
Console.WriteLine($"The sum of all even numbers till {num} : {sum}"); ;