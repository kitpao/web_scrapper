[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h2 align="center"> Ruby Web Scraper </h2>
  <p align="center">
      If you want the best exchange rate between Mexican pesos and Dollars...Test this out!!!
    <br />
    <a href="https://github.com/kitpao/web_scrapper"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/kitpao/web_scrapper">View Demo</a>
    ·
    <a href="https://github.com/kitpao/web_scrapper/issues">Report Bug</a>
    ·
    <a href="https://github.com/kitpao/web_scrapper/issues">Request Feature</a>
  </p>
</p>

## Table of Contents
* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)
<!-- ABOUT THE PROJECT -->

## About The Project
<small>(Click on the image to play with the code! See instructions in [Usage](#usage))</small>
[![Product Name Screen Shot][product-screenshot]](https://gitpod.io/github.com/kitpao/web_scrapper)

This program's purpose is to scan a web page and take relevant data from it that could benefit the user by exchanging local money (from Mexico) to dollars at the best rate and at the best time

This project includes technical assets as:
* Welcome screen
* Input validations
* Each hour, scrape a webpage with the data
* Make analysis with the data
* Notify user when something useful has been found

### Built With
The project was developed using the following technologies:
- [RUBY](https://www.ruby-lang.org/es/)
- [NOKOGIRI](https://github.com/sparklemotion/nokogiri)
- [HTTPARTY](https://github.com/jnunemaker/httparty)
- [RUBOCOP LINTERN](https://github.com/microverseinc/linters-config/tree/master/ruby)

## Usage

Click on the image at the top or in the following [link](https://gitpod.io/github.com/kitpao/web_scrapper),

* Click on the console below and type `bundle install` and hit enter to have all the necessary gems
* Click on the console and type `bin/main.rb` and hit enter to start the program
Now you can start getting the info in the console!!

<h3>Instructions</h3>

You can follow the instructions on the console screen or read them here:

* first thing you have to do, is select how fast you want to exchange your money:

  1 - Very fast - Quicker notifications but more volatile since it only takes the rates from the last 4 days
  
  2 - Fast - Quick notifications and less volatile since it is based on the last 7 days
  
  3 - Normal - Slow notifications but stable since it is based on the last 2 weeks
  
  4 - Long run - Slower notifications but the most reliable, since it takes the data from the last 30 days
  
* Next, you will get the results depending on your selection, you can get one or more of these posible answers:

  a) The price right now is the HIGHEST to sell!
  
  b) The price right now is the LOWEST to buy!
  
  c) There is nothing new
  
* This will be repeated each hour until the user finishes the program with an exit command (for example Ctrl + c)

![Product Name Screen Shot][product-example]

## Roadmap

See the [open issues](https://github.com/kitpao/web_scrapper/issues) for a list of proposed features (and known issues).

## Contact
<p align="center">

  Project Link: [https://github.com/kitpao/web_scrapper](https://github.com/kitpao/web_scrapper)

<p align="center">

  Kitzia Paola Vidal Marroquin - [Github user: kitpao](https://github.com/kitpao)
</p>
<p align="center" style="display: flex; justify-content: center; align-items: center;">
    <a target="_blank" href="https://mail.google.com/mail/?view=cm&fs=1&tf=1&to=kitpao91@gmail.com">
      kitpao91@gmail.com
    </a> &nbsp; |
    <a target="_blank" href="https://github.com/kitpao/Personal_Projects">
        Portfolio
    </a> &nbsp; |
    <a target="_blank" href="https://www.linkedin.com/in/kitzia-paola-vidal/">
      LinkedIn
    </a> &nbsp; |
    <a target="_blank" href="https://twitter.com/Kitpao1">
      Twitter
    </a>
</p>

## Acknowledgements
- [Microverse curriculum basic Ruby section](https://www.microverse.org/?grsf=6ns691)
- Microverse new capstone projects

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/kitpao/web_scrapper.svg?style=flat-square
[contributors-url]: https://github.com/kitpao/web_scrapper/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/kitpao/web_scrapper.svg?style=flat-square
[forks-url]: https://github.com/kitpao/web_scrapper/network/members
[stars-shield]: https://img.shields.io/github/stars/kitpao/web_scrapper.svg?style=flat-square
[stars-url]: https://github.com/kitpao/web_scrapper/stargazers
[issues-shield]: https://img.shields.io/github/issues/kitpao/web_scrapper.svg?style=flat-square
[issues-url]: https://github.com/kitpao/web_scrapper/issues
[license-shield]: https://img.shields.io/github/license/kitpao/web_scrapper.svg?style=flat-square
[license-url]: https://github.com/kitpao/web_scrapper/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/kitzia-paola-vidal/
[product-screenshot]: img/logo.png
[product-example]: img/example.png
