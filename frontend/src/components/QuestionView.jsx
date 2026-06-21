import React, { useState } from 'react';
import axios from 'axios';
import toast from 'react-hot-toast';
import { Button } from './ui/Button';
import { OptionCard } from './OptionCard';

const QuestionView = ({ question, onNext, onPrev, isLast, isFirst }) => {
    const [selectedOption, setSelectedOption] = useState(null);
    const [showSolution, setShowSolution] = useState(false);
    const [submitting, setSubmitting] = useState(false);
    const [result, setResult] = useState(null);

    // Reset state when question changes
    React.useEffect(() => {
        setSelectedOption(null);
        setShowSolution(false);
        setResult(null);
    }, [question.id]);

    const handleOptionSelect = (optionLabel) => {
        if (!result) {
            setSelectedOption(optionLabel);
        }
    };

    const handleSubmit = async () => {
        if (!selectedOption) return;

        setSubmitting(true);
        try {
            const token = localStorage.getItem('token');
            const headers = token ? { Authorization: `Bearer ${token}` } : {};

            const response = await axios.post(
                `/api/questions/${question.id}/attempt`,
                { selectedAnswer: selectedOption },
                { headers }
            );

            setResult(response.data);
            if (response.data.isCorrect) {
                toast.success('Correct Answer!');
            } else {
                toast.error('Incorrect Answer');
            }
            setShowSolution(true);
        } catch (error) {
            console.error('Error submitting answer:', error);
            toast.error('Failed to submit answer');
        } finally {
            setSubmitting(false);
        }
    };

    return (
        <div className="bg-white dark:bg-gray-800 rounded-lg shadow-md p-6 max-w-4xl mx-auto animate-slide-up">
            <div className="flex justify-between items-center mb-6">
                <span className="text-sm font-medium px-3 py-1 bg-primary-100 text-primary-800 rounded-full dark:bg-primary-900 dark:text-primary-200">
                    {question.topic_name}
                </span>
                <span className={`text-sm font-medium px-3 py-1 rounded-full ${question.difficulty === 'hard' ? 'bg-red-100 text-red-800' :
                    question.difficulty === 'medium' ? 'bg-yellow-100 text-yellow-800' :
                        'bg-green-100 text-green-800'
                    }`}>
                    {question.difficulty.charAt(0).toUpperCase() + question.difficulty.slice(1)}
                </span>
            </div>

            <div className="mb-8">
                <h2 className="text-xl font-semibold text-gray-900 dark:text-gray-100 mb-4">
                    {question.question}
                </h2>

                <div className="space-y-3 animate-fade-in" style={{ animationDelay: '0.2s', opacity: 0, animationFillMode: 'forwards' }}>
                    {question.options.map((option) => (
                        <OptionCard
                            key={option.option_label}
                            option={option}
                            isSelected={selectedOption === option.option_label}
                            result={result}
                            onSelect={handleOptionSelect}
                        />
                    ))}
                </div>
            </div>

            <div className="flex flex-col gap-4">
                {!result ? (
                    <Button
                        onClick={handleSubmit}
                        disabled={!selectedOption || submitting}
                        className="w-full md:w-auto self-end"
                    >
                        {submitting ? 'Checking...' : 'Check Answer'}
                    </Button>
                ) : (
                    <div className="bg-gray-50 dark:bg-gray-700/50 p-6 rounded-lg border border-gray-200 dark:border-gray-700">
                        <h3 className="font-bold text-lg mb-2 text-gray-900 dark:text-gray-100">
                            Solution
                        </h3>
                        <p className="text-gray-700 dark:text-gray-300 whitespace-pre-wrap">
                            {result.solution}
                        </p>
                        {result.explanation && (
                            <div className="mt-4 pt-4 border-t border-gray-200 dark:border-gray-600">
                                <h4 className="font-semibold text-gray-900 dark:text-gray-100 mb-1">
                                    Explanation
                                </h4>
                                <p className="text-sm text-gray-600 dark:text-gray-400">
                                    {result.explanation}
                                </p>
                            </div>
                        )}
                    </div>
                )}

                <div className="flex justify-between mt-6 pt-6 border-t border-gray-200 dark:border-gray-700">
                    <Button
                        variant="outline"
                        onClick={onPrev}
                        disabled={isFirst}
                    >
                        Previous
                    </Button>
                    <Button
                        onClick={onNext}
                        disabled={isLast}
                    >
                        Next
                    </Button>
                </div>
            </div>
        </div>
    );
};

export default QuestionView;
