CREATE DATABASE LibrarySystem;
USE LibrarySystem;
CREATE TABLE Member (
  memberNo VARCHAR(255) NOT NULL,
  memberName VARCHAR(255),
  memberTelNo VARCHAR(15),
  memberAddress VARCHAR(255),
  PRIMARY KEY (memberNo)
);
CREATE TABLE BookTitle (
  ISBN VARCHAR(50) NOT NULL,
  bookTitle VARCHAR(255) NOT NULL,
  bookAuthor VARCHAR(255) NOT NULL,
  PRIMARY KEY (ISBN)
);
CREATE TABLE BookCopy (
  bookCopyNo VARCHAR(50) NOT NULL,
  bookPurchaseDate DATETIME(6),
  bookPrice DECIMAL(5, 2),
  ISBN VARCHAR(50) NOT NULL,
  PRIMARY KEY (bookCopyNo),
  FOREIGN KEY (ISBN) REFERENCES BookTitle(ISBN)
);
CREATE TABLE Reservation (
  reservationNo VARCHAR(255) NOT NULL,
  memberNo VARCHAR(255) NOT NULL,
  ISBN VARCHAR(15) NOT NULL,
  reservationDate DATETIME(6),
  PRIMARY KEY (reservationNo),
  FOREIGN KEY (memberNo) REFERENCES Member(memberNo),
  FOREIGN KEY (ISBN) REFERENCES BookTitle(ISBN)
);
CREATE TABLE Borrow (
  memberNo VARCHAR(255) NOT NULL,
  bookCopyNo VARCHAR(255) NOT NULL,
  dueDate DATETIME(6),
  loanDate DATETIME(6),
  returnDate DATETIME(6),
  FOREIGN KEY (memberNo) REFERENCES Member(memberNo),
  FOREIGN KEY (bookCopyNo) REFERENCES BookCopy(bookCopyNo),
  CONSTRAINT PK_Borrow PRIMARY KEY (memberNo, bookCopyNo)
);
-- DROP DATABASE LibrarySystem