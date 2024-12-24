package book.mgmt.entities;

public class Book {
    private int id;
    private String barcode;
    private String name;
    private String author;
    private double price;
    private int quantity;

    public Book() {
        super();
    }
    

    public Book(int id, String name, String author, double price) {
		super();
		this.id = id;
		this.name = name;
		this.author = author;
		this.price = price;
	}


	public Book(String barcode, String name, String author, double price, int quantity) {
        super();
        this.barcode = barcode;
        this.name = name;
        this.author = author;
        this.price = price;
        this.quantity = quantity;
    }

    public Book(int id, String barcode, String name, String author, double price, int quantity) {
        super();
        this.id = id;
        this.barcode = barcode;
        this.name = name;
        this.author = author;
        this.price = price;
        this.quantity = quantity;
    }

    // Getters and setters for each field

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Book [id=" + id + ", barcode=" + barcode + ", name=" + name + ", author=" + author + ", price=" + price
                + ", quantity=" + quantity + "]";
    }
}
