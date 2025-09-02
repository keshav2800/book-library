package com.example.book.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.book.entity.Book;
import com.example.book.repo.BookRepository;

@Controller
@RequestMapping("/library")
public class BookController {
    @Autowired
    private BookRepository bookRepository;

    @GetMapping("/addBookForm")
    public String displayAddBookForm(Model model) {
        model.addAttribute("book", new Book());
        return "addBook";
    }

    @RequestMapping("/home")
    public String home(Model model) {
        model.addAttribute("appName", "Java Training School Library");
        return "home";
    }

    @RequestMapping("/display")
    public String displayBookInfo(Model model) {
        List<Book> allBooks = (List<Book>) bookRepository.findAll();
        model.addAttribute("books", allBooks);
        if (allBooks.isEmpty())
            model.addAttribute("msg", "Unfortunately, the library is empty now. Let's"
                    + "contribute by adding some books");
        else {
            if (model.getAttribute("msg") == null)
                model.addAttribute("msg", "Welcome to Java Traning School Library");
        }

        return "displayBook";
    }

    @PostMapping("/addBook")
    public String addBook(@ModelAttribute("book") Book book, Model model) {
        book.setStatus("available");
        book.setBorrowedDate(null);
        book.setBorrowedForDays(0);
        bookRepository.save(book);
        model.addAttribute("msg", "Book added successfully. Thanks");
        return displayBookInfo(model);
    }
    
    @GetMapping("/updateBookForm/{id}")
    public String showUpdateForm(@PathVariable("id") int id, Model model) {
        Book book = bookRepository.findById(id).orElse(null);
        model.addAttribute("book", book);
        return "updateBook";
    }

    @PostMapping("/updateBook/{id}")
    public String updateBook(@PathVariable("id") int id, @ModelAttribute("book") Book updatedBook, Model model) {
        Optional<Book> optionalBook = bookRepository.findById(id);
        if (optionalBook.isPresent()) {
            Book existingBook = optionalBook.get();
            existingBook.setName(updatedBook.getName());
            existingBook.setAuthor(updatedBook.getAuthor());
            existingBook.setPrice(updatedBook.getPrice());
            bookRepository.save(existingBook);
            model.addAttribute("msg", "Book details updated successfully.");
        } else {
            model.addAttribute("msg", "Book not found.");
        }
        return displayBookInfo(model);
    }

    @GetMapping("/deleteBook/{id}")
    public String deleteBook(@PathVariable("id") int id, Model model) {
        bookRepository.deleteById(id);
        model.addAttribute("msg", "Book deleted successfully.");
        return displayBookInfo(model);
    }

    @GetMapping("/borrowForm/{id}")
    public String showBorrowForm(@PathVariable("id") int id, Model model) {
        Book book = bookRepository.findById(id).orElse(null);
        model.addAttribute("book", book);
        return "borrowBook";
    }

    @PostMapping("/borrowBook/{id}")
    public String borrowBook(@PathVariable("id") int id,
                             @RequestParam("days") int days,
                             Model model) {

        Optional<Book> optionalBook = bookRepository.findById(id);

        if (optionalBook.isPresent()) {
            Book book = optionalBook.get();

            if ("available".equalsIgnoreCase(book.getStatus())) {
                book.setStatus("borrowed");
                book.setBorrowedForDays(days);
                book.setBorrowedDate(LocalDate.now()); 
                bookRepository.save(book);             
                model.addAttribute("msg", "Book borrowed successfully for " + days + " days.");
            } else {
                model.addAttribute("msg", "Book is already borrowed.");
            }

        } else {
            model.addAttribute("msg", "Book not found.");
        }

        return displayBookInfo(model); 
    }
}
 