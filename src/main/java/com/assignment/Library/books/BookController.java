package com.assignment.Library.books;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import jakarta.validation.Valid;

@Controller
@SessionAttributes("username")
public class BookController {
   
    private BookRepository bookRepository;
    
    // Or if you want to use Service layer instead of Repository directly:
    // @Autowired
    // private BookService bookService;
    
    public BookController(BookRepository bookRepository) {
		super();
		this.bookRepository = bookRepository;
	}

	@RequestMapping("list_books")
    public String listAllBooks(ModelMap model) {
		String username=getLoggedInUsername(model);
        List<Book> books = bookRepository.findByUsername(username);
        model.addAttribute("books", books);
        return "books";
    }
    
    @RequestMapping(value="add-book", method = RequestMethod.GET)
    public String showNewBookPage(ModelMap model) {
    	String username = getLoggedInUsername(model);
        Book book = new Book(0, "", "", "", true,username);
        model.put("book", book);
        return "new_book";
    }
    
    @RequestMapping(value="add-book", method = RequestMethod.POST)
    public String addNewBook(ModelMap model, @Valid Book book, BindingResult result) {
        if(result.hasErrors()) {
            return "new_book";
        }
        String username = getLoggedInUsername(model);
		book.setUsername(username);
        bookRepository.save(book);
        return "redirect:list_books";
    }
    
    @RequestMapping("delete-book")
    public String deleteBook(@RequestParam int id) {
        bookRepository.deleteById(id);
        return "redirect:list-books";
    }
    
    @RequestMapping(value="update-book", method = RequestMethod.GET)
    public String showUpdateBookPage(@RequestParam int id, ModelMap model) {
        Book book = bookRepository.findById(id).get();
        model.addAttribute("book", book);
        return "new_book";
    }

    @RequestMapping(value="update-book", method = RequestMethod.POST)
    public String updateBook(ModelMap model, @Valid Book book, BindingResult result) {
        if(result.hasErrors()) {
            return "new_book";
        }
        String username = getLoggedInUsername(model);
		book.setUsername(username);
        bookRepository.save(book);
        return "redirect:list_books";
    }
    
    // for updating the availability using the button
    @RequestMapping("toggle-availability")
    public String toggleAvailability(@RequestParam int id) {
        Book book = bookRepository.findById(id).get();
        book.setAvail(!book.isAvail());
        bookRepository.save(book);
        return "redirect:list_books";
    }
    
    @RequestMapping(value="find-book",method = RequestMethod.GET)
    public String Findbook(ModelMap model,@RequestParam String title) {
    	String username = getLoggedInUsername(model);
    	List<Book> foundBooks = bookRepository.findByTitleContainingAndUsername(title, username);
    	model.addAttribute("foundBooks", foundBooks);
    	model.addAttribute("searchTitle", title);
    	return "find";
    }
    
    private String getLoggedInUsername(ModelMap model) {
		Authentication authentication = 
				SecurityContextHolder.getContext().getAuthentication();
		return authentication.getName();
    }
}