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
				shuffle($choices);
				$i = 1;
				foreach ($choices as $choice) {
					echo "\t$i.$choice\r\n";
					$i++;
				}
				
				$stdin = fopen('php://stdin', 'r');
				$choice = fgets($stdin);

				if ($choice == $answer) {

				} else {

				}	
				echo "\r\n";
				$questionNumber++;
			}
		}
	}
}
