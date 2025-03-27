package com.assignment.Library.books;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Book {
	
	public Book() {
		
	}
	public Book(int id, String title, String author, String genre, boolean avail,String username) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.genre = genre;
		this.avail = avail;
		this.username=username;
	}
	
	@Id
	@GeneratedValue
	private int id;
	private String title;
	private String author;
	private String genre;
	private boolean avail;
	private String username;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public boolean isAvail() {
		return avail;
	}
	public void setAvail(boolean avail) {
		this.avail = avail;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "Book [id=" + id + ", title=" + title + ", author=" + author + ", genre=" + genre + ", avail=" + avail
				+ ", username=" + username + "]";
	}
	
	
}
