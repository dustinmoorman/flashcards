<?php

namespace Flashcards;

class Exam
{
	protected $_questions = [];
	protected $_scoreKeep;
	const ALL_OF_THE_ABOVE = 'All of the above';
	
	public function __construct($questions = [])
	{
		$this->_questions = $questions;
		$this->_scoreKeep = new Exam\ScoreKeep();
	}

	public function present()
	{
		if (count($this->_questions) > 0) {
			$this->clear();
			$questionNumber = 1;

			Exam\Timer::start();			

			foreach ($this->_questions as $question) {
				echo '[' 
					. $questionNumber 
					. '/' 
					. count($this->_questions) 
					. '] ' 
					. $question['question'] 
					. "\r\n\r\n";
					
				$choices = array_merge(['answer' => $question['answer']], $question['incorrect']);
				$shuffledChoices = $this->shuffleAnswers($choices);
				$answerNumber = 1;
				
				foreach ($shuffledChoices as $k => $choice) {
					echo "\t$answerNumber. $choice \r\n"; 
					if ($k === 'answer') $answerChoice = $answerNumber;
					$answerNumber++;	
				}

                		echo "\r\n";
				$choice = '';
				
				do {	
					$choice = $this->getUserInput();
				} while (strlen($choice) != 1 || !preg_match("/([1-9]|q)/i", $choice));
				
				if ($choice == 'q') {
					$this->quit();
					return;
				} else if ($choice == $answerChoice) {
					echo "\r\nCorrect!\r\n";
					$this->_scoreKeep->correct();
				} else {
					echo "\r\nNope. The answer is:";
					echo "\r\n" . $question['answer'] . "\r\n";
					$this->_scoreKeep->wrong($question);
				}	
				
				$this->_scoreKeep->questionAttempted();				
				
				if (isset($question['explain'])) {
					echo "\r\n" . $question['explain'] . "\r\n";
					echo "\r\nPress enter to continue...";
					$this->getUserInput();
				} else {
					sleep(2);
				}

				$this->clear();
				$questionNumber++;
			}

			$this->quit();
		}
	}

	protected function getUserInput()
	{
		echo '$ ';
		$stdin = fopen('php://stdin', 'r');
		return trim(fgets($stdin));
	}
	
	protected function shuffleAnswers($choices)
	{
		$allOfTheAboveKey = false;
		if (($allOfTheAboveKey = array_search(self::ALL_OF_THE_ABOVE, $choices)) !== false) {
			unset($choices[$allOfTheAboveKey]);
		}

		if (!is_array($choices)) return $choices;

		$keys = array_keys($choices);
		shuffle($keys);
		$shuffled = array();
		
		foreach ($keys as $key) {
			$shuffled[$key] = $choices[$key];
		}

		if (false !== $allOfTheAboveKey) {
			$shuffled[$allOfTheAboveKey] = self::ALL_OF_THE_ABOVE;
		}

		return $shuffled;
	}

	public static function knuthShuffle(&$array) 
	{
		for ($i = count($array) - 1; $i > 0; $i--) {
			$rand = mt_rand(0,$i);
			list($array[$i], $array[$rand]) = [$array[$rand], $array[$i]];
		}
	}
	
	protected function getResults()
	{
		echo 'You scored ' 
			. $this->_scoreKeep->getScore() 
			. ' with a time of '
			. $this->getTime()
			. "\r\n";
	}

	protected function quit()
	{
		$this->clear();
		echo "Alright you're done.\r\n";
		$this->getResults();
		echo "\r\n[Q]uit, [R]etest missed questions, R[e]view missed questions\r\n\r\n";
		$choice = $this->getUserInput();

		if ($choice == 'e') {
			$this->reviewIncorrect($this->_scoreKeep->getIncorrectlyAnsweredQuestions());
		} elseif($choice == 'R' || $choice == 'r') {
			$Retest = new Exam($this->_scoreKeep->getIncorrectlyAnsweredQuestions());
			$Retest->present();
		} else {
			$this->clear();
		}
	}

	protected function clear()
	{
		PHP_SHLIB_SUFFIX == 'dll' ? system('cls') : system('clear');
	}

	protected function getTime()
	{
		return gmdate("H:i:s", Exam\Timer::stop());
	}

	protected function reviewIncorrect($questions)
	{
		$reviewNumber = 1;
		$reviewCount = count($questions);

		foreach ($questions as $question) {
			$this->clear();
			
			echo '[' 
				. $reviewNumber 
				. '/' 
				. $reviewCount 
				. '] ' 
				. $question['question'] 
				. "\r\n\r\n";
				
			echo $question['answer'] . "\r\n";
			
			if (isset($question['explain'])) {
				echo $question['explain'];
			}

			$this->getUserInput();
			$reviewNumber++;
		}

		$this->quit();
	}
}
