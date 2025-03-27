package com.assignment.Library.books;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Integer> {
	public List<Book> findByUsername(String username);
	public List<Book> findByAuthor(String author);
    public List<Book> findByAvail(boolean avail);
    public List<Book> findByGenre(String genre);
}