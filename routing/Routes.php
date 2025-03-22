<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

$routes->get('/About', 'Page::about');
$routes->get('/contact', 'Page::contact');
$routes->get('/Faqs', 'Page::faqs');
$routes->get('/Biodata', 'Page::biodata');
$routes->setAutoRoute(false);