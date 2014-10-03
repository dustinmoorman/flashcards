<?php

namespace Flashcards;

class Exam
{
	protected $_questions = [];
	
	public function __construct($questions = [])
	{
		$this->_questions = $questions;
	}

	public function present()
	{
		if (count($this->_questions) > 0) {
			shuffle($this->_questions);
			system('clear');
			$questionNumber = 1;
			foreach ($this->_questions as $question) {
				echo $questionNumber . '. ' . $question['question'] . "\r\n";
				$choices = array_merge(['answer' => $question['answer']], $question['incorrect']);
				$this->shuffleAnswers($choices);
				$i = 1;
				foreach ($choices as $k => $choice) {
					echo "\t$i.$choice \r\n"; 
					if($k === 'answer') $answer_choice = $i;
					$i++;	
				}
				
				$stdin = fopen('php://stdin', 'r');
				$choice = fgets($stdin);

				if ($choice == $answer_choice) {
					echo "\r\nCorrect!\r\n";
				} else {
					echo "\r\nNope.";	
				}	

				sleep(2);
				system('clear');
				$questionNumber++;
			}
		}
	}
	
	protected function shuffleAnswers($choices)
	{
		if(!is_array($choices)) return $choices;

		$keys = array_keys($choices);
		shuffle($keys);
		$shuffled = array();
		foreach ($keys as $key) {
			$shuffled[$key] = $choices[$key];
		}
		return $shuffled;
	}
}
