package com.assignment.Library.books;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import org.springframework.stereotype.Service;

@Service
public class BookService {
    private static List<Book> books = new ArrayList<>();
    private static int count = 0;
    
    static {
        books.add(new Book(count++, "The Great Gatsby", "F. Scott Fitzgerald", "Classic", true,"harsh"));
        books.add(new Book(count++, "To Kill a Mockingbird", "Harper Lee", "Fiction", true,"harsh"));
        books.add(new Book(count++, "1984", "George Orwell", "Dystopian", false,"harsh"));
    }
    
    public List<Book> findAllBooks() {
        return books;
    }
    
    public List<Book> findByUsername(String username) {
        Predicate<? super Book> predicate = book -> book.getUsername().equalsIgnoreCase(username);
        return books.stream().filter(predicate).toList();
    }
    
    public void addBook(String title, String author, String genre, boolean avail,String username) {
        Book book = new Book(count++, title, author, genre, avail,username);
        books.add(book);
    }
    
    public void deleteById(int id) {
        Predicate<? super Book> predicate = book -> book.getId() == id;
        books.removeIf(predicate);
    }
    
    public Book findById(int id) {
        Predicate<? super Book> predicate = book -> book.getId() == id;
        return books.stream().filter(predicate).findFirst().get();
    }
    
    public void updateBook(Book book) {
        deleteById(book.getId());
        books.add(book);
    }
    
    public void toggleAvailability(int id) {
        Book book = findById(id);
        book.setAvail(!book.isAvail());
    }
}