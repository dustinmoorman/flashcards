<?php

if (isset($argv[1])) {
	if(file_exists($argv[1]) 
		&& (strpos($argv[1], '.php') 
			|| strpos($argv[1], '.json'))) {
		
	} else {
		echo "Invalid question file";
	}
} else {
	echo "No questions provided.";
}
