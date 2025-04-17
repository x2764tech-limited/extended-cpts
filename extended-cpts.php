<?php

/*
   Plugin Name: Extended-CPTS
   Plugin URI: https://github.com/x2764tech/extended-cpts
   Description: Wrapper around extended-cpts library
   Version: 5.0.12
   Author: x2764tech limited
   Author URI: https://x2764te.ch/
   Copyright 2025 Shared and distributed by x2764tech limited
 */


require_once 'vendor/autoload.php';

$x2764tech_xcpts__updater = new Inc2734\WP_GitHub_Plugin_Updater\Bootstrap(
    plugin_basename( __FILE__ ),
    'x2764tech-limited',
    'extended-cpts'
);