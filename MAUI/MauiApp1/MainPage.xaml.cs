namespace MauiApp1;

public partial class MainPage : ContentPage
{
	int count = 0;

	public class Person
	{
		public string Name { get; set; }
		public int Age { get; set; }
        public string Address { get; set; }
    }


    public List<Person> People { get; set; }


    public MainPage()
	{
		InitializeComponent();

        People = new List<Person>
            {
                new Person { Name = "John Doe", Age = 30, Address = "123 Main St" },
                new Person { Name = "Jane Smith", Age = 25, Address = "456 Elm St" }
                // Add more data as needed
            };

        this.BindingContext = this;
    }

	private void OnCounterClicked(object sender, EventArgs e)
	{
		count++;

		if (count == 1)
			CounterBtn.Text = $"Clicked {count} time";
		else
			CounterBtn.Text = $"Clicked {count} times";

		SemanticScreenReader.Announce(CounterBtn.Text);
	}
}

