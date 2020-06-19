-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2020 at 01:00 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `idiscuss`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(8) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `created`) VALUES
(1, 'Python', 'Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python\'s design philosophy emphasizes code readability with its notable use of significant whitespace.', '2020-06-17 10:35:33'),
(2, 'Javascript', 'JavaScript, often abbreviated as JS, is a programming language that conforms to the ECMAScript specification. JavaScript is high-level, often just-in-time compiled, and multi-paradigm. It has curly-bracket syntax, dynamic typing, prototype-based object-or', '2020-06-17 10:36:09'),
(3, 'Java', 'Java is a general-purpose programming language that is class-based and object-oriented language', '2020-06-17 12:51:14'),
(4, 'Django', 'Django is a Python-based free and open-source web framework that follows the model-template-view architectural pattern. ', '2020-06-17 12:51:54'),
(5, 'React Js', 'React is an open-source JavaScript library for building user interfaces. It is maintained by Facebook and a community of individual developers and companies.', '2020-06-17 13:20:13'),
(6, 'C', 'C is a general-purpose, procedural computer programming language supporting structured programming, lexical variable scope, and recursion, with a static type system. By design, C provides constructs that map efficiently to typical machine instructions.', '2020-06-18 13:56:07'),
(7, 'C++', 'C++ is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or \"C with Classes\".', '2020-06-18 13:56:47'),
(8, 'php', 'PHP is a popular general-purpose scripting language that is especially suited to web development. It was originally created by Danish-Canadian programmer Rasmus Lerdorf in 1994; the PHP reference implementation is now produced by The PHP Group.', '2020-06-18 13:57:51'),
(9, 'JQuery', 'jQuery is a JavaScript library designed to simplify HTML DOM tree traversal and manipulation, as well as event handling, CSS animation, and Ajax. It is free, open-source software using the permissive MIT License. As of May 2019, jQuery is used by 73% of t', '2020-06-18 13:58:33'),
(10, 'Node JS', 'Node.js is an open-source, cross-platform, JavaScript runtime environment that executes JavaScript code outside a web browser.', '2020-06-18 14:00:07'),
(11, 'MySQL', 'MySQL is an open-source relational database management system. Its name is a combination of \"My\", the name of co-founder Michael Widenius\'s daughter, and \"SQL\", the abbreviation for Structured Query Language.', '2020-06-18 14:01:03'),
(12, 'HTML', 'Hypertext Markup Language is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScript, ASP and PHP', '2020-06-18 14:02:00'),
(13, 'CSS', 'Cascading Style Sheets is a style sheet language used for describing the presentation of a document written in a markup language like HTML. CSS is a cornerstone technology of the World Wide Web, alongside HTML and JavaScript.', '2020-06-18 14:02:23'),
(14, 'C#', 'C# is a general-purpose, multi-paradigm programming language encompassing strong typing, lexically scoped, imperative, declarative, functional, generic, object-oriented, and component-oriented programming disciplines.', '2020-06-18 14:04:08'),
(15, 'R', 'R is a programming language and free software environment for statistical computing and graphics supported by the R Foundation for Statistical Computing. The R language is widely used among statisticians and data miners for developing statistical software', '2020-06-18 14:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(8) NOT NULL,
  `comment_content` text NOT NULL,
  `thread_id` int(8) NOT NULL,
  `comment_by` int(8) NOT NULL,
  `comment_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_content`, `thread_id`, `comment_by`, `comment_time`) VALUES
(1, 'Reinstall pycharm then it will work from official python website', 1, 7, '2020-06-17 19:19:57'),
(2, 'Check the port setting', 1, 6, '2020-06-17 20:05:53'),
(3, 'Check the port setting', 1, 9, '2020-06-17 20:09:18'),
(4, 'No its not to hard if you know python well!', 5, 7, '2020-06-17 20:10:47'),
(5, 'Dataframes are pandas members to access big data', 4, 11, '2020-06-17 23:21:17'),
(6, 'DataFrame is a 2-dimensional labeled data structure with columns of potentially different types.', 4, 11, '2020-06-18 11:57:17'),
(7, 'Yes its the simplest way to do this', 11, 11, '2020-06-18 14:22:52'),
(8, 'Use &lt;a href=\"#\"&gt;link&lt;/a&gt;', 11, 11, '2020-06-18 14:23:20');

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE `queries` (
  `qid` int(8) NOT NULL,
  `qemail` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `qtext` text NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `queries`
--

INSERT INTO `queries` (`qid`, `qemail`, `title`, `qtext`, `timestamp`) VALUES
(1, 'sachin@gmail.com', '', 'What components you have used for making this website', '2020-06-18 14:53:27'),
(2, 'satyam@h.com', 'Are you aditya dhaygude', 'Are you aditya dhaygude', '2020-06-18 15:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `threads`
--

CREATE TABLE `threads` (
  `thread_id` int(7) NOT NULL,
  `thread_title` varchar(255) NOT NULL,
  `thread_desc` text NOT NULL,
  `thread_cat_id` int(7) NOT NULL,
  `thread_user_id` int(7) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `threads`
--

INSERT INTO `threads` (`thread_id`, `thread_title`, `thread_desc`, `thread_cat_id`, `thread_user_id`, `timestamp`) VALUES
(1, 'Unable to install pycharm', 'Unable to install pycharm on windows dont no why there is an error!', 1, 7, '0000-00-00 00:00:00'),
(2, 'Unable to start server', 'i am unable to start my project', 5, 8, '0000-00-00 00:00:00'),
(3, 'unable to handle collection', 'unable to handle collection', 3, 11, '2020-06-17 18:47:35'),
(4, 'what is dataframes', 'I want to know about dataframes and how to fetch part of data from it', 1, 7, '2020-06-17 18:54:13'),
(5, 'Is Django hard to learn', 'I have been heard that Django is hard to learn is it so?', 4, 9, '2020-06-17 18:56:41'),
(6, 'How to set java environment', 'Unable to set java environment please help!', 3, 0, '2020-06-18 12:02:31'),
(7, 'How to set java environment', 'Unable to set java environment please help!', 3, 11, '2020-06-18 12:03:44'),
(8, 'How to set java environment', 'Unable to set java environment please help!', 3, 11, '2020-06-18 12:08:09'),
(9, 'How to set java environment', 'Unable to set java environment please help!', 3, 11, '2020-06-18 12:08:21'),
(10, 'DOM element', 'What are the different ways to get an element from DOM?', 2, 10, '2020-06-18 12:36:52'),
(11, 'How to link a new page', 'Can I use &lt;a&gt; tag for linking to new page', 12, 10, '2020-06-18 14:22:08'),
(12, 'outdated php', 'Is php outdated', 8, 11, '2020-06-18 18:02:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `sno` int(8) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sno`, `email`, `password`, `timestamp`) VALUES
(1, '', '$2y$10$VuQD/YrrlJjsYy8TUEszhuNKPV.AsDt0P82UccYgFqVyg6hAgyXRC', '2020-06-17 21:08:59'),
(2, '', '$2y$10$8lhehhB3Y0T6WuA2dnzanOPj.yBt/Oa7TIG8FJwE75hjy.aI.AB3C', '2020-06-17 21:11:08'),
(3, 'aditya@gmail.com', '123', '2020-06-17 21:16:19'),
(4, 'xyz@gmail.com', '$2y$10$dRrCILbpXNUROxeadwhFBejPBEnJJNIs1T7Kpf4fP6z9WRs.7dISG', '2020-06-17 21:17:59'),
(5, 'sat@gmail.com', '$2y$10$C6vr6P0rY78j4vR0jfAXjeNwa7NY6yAwGPqQeLH6HDXGMI6iX8oQq', '2020-06-17 21:26:46'),
(6, 'xyz@gmail.com', '$2y$10$6GgsWqIBGxxjHHCP53sxPOQK/v.9nZfyYBe6dyxOp8cXtNLxutji6', '2020-06-17 21:29:00'),
(7, 'xyz@gmail.com', '$2y$10$/adUrvxHkl/P8fs/k5B9T.eI7A6Zgw94e/xx3TmiY55SYiMBmjVQ2', '2020-06-17 21:31:52'),
(8, 'fandry@1.com', '$2y$10$u6XVCL9NuW6zH/R.2kDzcethgHoLeTc1ewbxoT.32OBtqQpAfN00G', '2020-06-17 22:21:23'),
(9, 'satyam@h.com', '$2y$10$Eni1qdNzqvaSG5fhSiRije67HeHUiqD7vQElkz/lEVkubLBlRgsC2', '2020-06-17 22:44:54'),
(10, 'sachin@gmail.com', '$2y$10$3Gjwe6uaLRaA7.h/d3057eN.gjWFlt.spbTbxgT9/.dZTZfxftDRW', '2020-06-17 22:59:45'),
(11, 'adi@adi.com', '$2y$10$icNdj0nYhuYq7W2mwnsPYOMrc1aLreUsaxk6vSWLI6ibI1NuW6CGm', '2020-06-17 23:21:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `queries`
--
ALTER TABLE `queries`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `threads`
--
ALTER TABLE `threads`
  ADD PRIMARY KEY (`thread_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `queries`
--
ALTER TABLE `queries`
  MODIFY `qid` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `threads`
--
ALTER TABLE `threads`
  MODIFY `thread_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `sno` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
