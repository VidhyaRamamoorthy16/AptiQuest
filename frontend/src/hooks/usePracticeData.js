import { useState, useEffect, useCallback } from 'react';
import axios from 'axios';
import toast from 'react-hot-toast';

export const usePracticeData = (section, topicName) => {
    const [topics, setTopics] = useState([]);
    const [questions, setQuestions] = useState([]);
    const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    // Fetch Topics
    useEffect(() => {
        if (topicName) return;

        const fetchTopics = async () => {
            try {
                setLoading(true);
                const response = await axios.get(`/api/questions/topics?section=${section}`);
                if (response.data.success) {
                    setTopics(response.data.topics);
                }
            } catch (err) {
                console.error('Error fetching topics:', err);
                setError('Failed to load topics. Please try again.');
                toast.error('Failed to load topics');
            } finally {
                setLoading(false);
            }
        };

        fetchTopics();
    }, [section, topicName]);

    // Fetch Questions
    useEffect(() => {
        if (!topicName) {
            setQuestions([]);
            return;
        }

        const fetchQuestions = async () => {
            try {
                setLoading(true);
                const response = await axios.get(`/api/questions?section=${section}&topic=${topicName}&limit=100`);
                if (response.data.success) {
                    setQuestions(response.data.questions);
                    setCurrentQuestionIndex(0);
                }
            } catch (err) {
                console.error('Error fetching questions:', err);
                setError('Failed to load questions. Please try again.');
                toast.error('Failed to load questions');
            } finally {
                setLoading(false);
            }
        };

        fetchQuestions();
    }, [section, topicName]);

    const handleNext = useCallback(() => {
        setCurrentQuestionIndex(prev => Math.min(prev + 1, questions.length - 1));
    }, [questions.length]);

    const handlePrev = useCallback(() => {
        setCurrentQuestionIndex(prev => Math.max(prev - 1, 0));
    }, []);

    return {
        topics,
        questions,
        currentQuestionIndex,
        loading,
        error,
        handleNext,
        handlePrev,
    };
};
