import React from 'react';

export const OptionCard = ({ option, isSelected, result, onSelect }) => {
    const getBorderClass = () => {
        if (result && option.option_label === result.correctAnswer) {
            return 'border-green-500 bg-green-50 dark:bg-green-900/20';
        }
        if (result && isSelected && !result.isCorrect) {
            return 'border-red-500 bg-red-50 dark:bg-red-900/20';
        }
        if (isSelected) {
            return 'border-primary-500 bg-primary-50 dark:bg-primary-900/20 shadow-sm';
        }
        return 'border-slate-200 dark:border-slate-700 hover:border-primary-300 hover:bg-slate-50 dark:hover:bg-slate-800/50';
    };

    const getCircleClass = () => {
        if (isSelected) {
            return 'bg-primary-500 text-white';
        }
        return 'bg-slate-100 text-slate-600 dark:bg-slate-800 dark:text-slate-400';
    };

    return (
        <div
            onClick={() => onSelect(option.option_label)}
            className={`p-4 rounded-xl border-2 cursor-pointer transition-all duration-200 ${getBorderClass()}`}
        >
            <div className="flex items-center gap-4">
                <span
                    className={`w-10 h-10 flex items-center justify-center rounded-full font-bold text-sm transition-colors ${getCircleClass()}`}
                >
                    {option.option_label}
                </span>
                <span className="text-slate-700 dark:text-slate-200 font-medium">
                    {option.option_text}
                </span>
            </div>
        </div>
    );
};
