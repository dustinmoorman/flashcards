#!/usr/bin/env php
<?php
require_once 'autoload.php';

if (isset($argv[1])) {
	if (file_exists($argv[1]) 
		&& (strpos($argv[1], '.php') 
			|| strpos($argv[1], '.json'))) {
		
		if (strpos($argv[1], '..') !== false) {
			echo "Nope!\r\n";
		}

		$questions = [];		

		if (strpos($argv[1], '.php')) {
			$questions = include $argv[1];
		} else if (strpos($argv[1], '.json')) {
			$json = file_get_contents($argv[1]);
			$questions = json_decode($json, 1);
		}

		if (count($questions) > 0) {
			\Flashcards\Exam::knuthShuffle($questions);
			if (isset($argv[2]) 
				&& is_numeric($argv[2]) 
				&& $argv[2] < count($questions)) {
				$questions = array_slice($questions, count($questions) - $argv[2]);
			} 			
			$Exam = new \Flashcards\Exam($questions);
			$Exam->present();

		} else {
			echo "No questions provided\r\n";
		}
	} else {
		echo "Invalid question file.\r\n";
	}
} else {
	echo "No questions provided.\r\n";
}
