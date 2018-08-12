
package com.sgc.model;
      
    public class Book{
    
    private int bookId, noOfPages, yearOfPublishing, lastPrintedYear,mainClassification,subClassification;
    private String title, isbnNo, author, publisher,mainClassificationName,subClassificationName;

    public String getMainClassificationName() {
        return mainClassificationName;
    }

    public void setMainClassificationName(String mainClassificationName) {
        this.mainClassificationName = mainClassificationName;
    }

    public String getSubClassificationName() {
        return subClassificationName;
    }

    public void setSubClassificationName(String subClassificationName) {
        this.subClassificationName = subClassificationName;
    }
    

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int BookId) {
        this.bookId = BookId;
    }

    public String getIsbnNo() {
        return isbnNo;
    }

    public void setIsbnNo(String isbnNo) {
        this.isbnNo = isbnNo;
    }

    public int getNoOfPages() {
        return noOfPages;
    }

    public void setNoOfPages(int noOfPages) {
        this.noOfPages = noOfPages;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMainClassification() {
        return mainClassification;
    }

    public void setMainClassification(int mainClassification) {
        this.mainClassification = mainClassification;
    }

    public int getSubClassification() {
        return subClassification;
    }

    public void setSubClassification(int subClassification) {
        this.subClassification = subClassification;
    }

    public int getYearOfPublishing() {
        return yearOfPublishing;
    }

    public void setYearOfPublishing(int yearOfPublishing) {
        this.yearOfPublishing = yearOfPublishing;
    }

    public int getLastPrintedYear() {
        return lastPrintedYear;
    }

    public void setLastPrintedYear(int lastPrintedYear) {
        this.lastPrintedYear = lastPrintedYear;
    }    

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    
    public Book(){
    }
    
    public Book(String title, String author, String publisher, String isbn, int lastPrintedYear, int noOfPages, int mainClassification, int subClassification, int yearOfPublishing){
        
    this.title = title;
    this.author = author;
    this.publisher = publisher;
    this.isbnNo = isbn;
    this.lastPrintedYear = lastPrintedYear;
    this.noOfPages = noOfPages;
    this.subClassification =  subClassification;
    this.mainClassification = mainClassification;
    this.yearOfPublishing = yearOfPublishing;
    }  
    
    public Book(int id, String title, String author, String publisher, String isbn, int lastPrintedYear, int noOfPages, int mainClassification, int subClassification, int yearOfPublishing){
    
    this.bookId = id;
    this.title = title;
    this.author = author;
    this.publisher = publisher;
    this.isbnNo = isbn;
    this.lastPrintedYear = lastPrintedYear;
    this.noOfPages = noOfPages;
    this.subClassification =  subClassification;
    this.mainClassification = mainClassification;
    this.yearOfPublishing = yearOfPublishing;
    }  
    
        
    }
        

