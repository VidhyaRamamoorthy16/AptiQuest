import { useState, useEffect } from 'react'
import { Search, X, SlidersHorizontal } from 'lucide-react'

const FilterBar = ({ 
  searchTerm, 
  onSearchChange, 
  difficulty, 
  onDifficultyChange, 
  status, 
  onStatusChange, 
  sort, 
  onSortChange, 
  totalCount, 
  filteredCount,
  onClearFilters 
}) => {
  const [localSearch, setLocalSearch] = useState(searchTerm)
  const [isMobileOpen, setIsMobileOpen] = useState(false)

  // Debounce search input
  useEffect(() => {
    const handler = setTimeout(() => {
      onSearchChange(localSearch)
    }, 400)

    return () => clearTimeout(handler)
  }, [localSearch])

  // Sync local search with external search (e.g. when cleared)
  useEffect(() => {
    setLocalSearch(searchTerm)
  }, [searchTerm])

  const hasActiveFilters = 
    searchTerm !== '' || 
    difficulty !== 'all' || 
    status !== 'all' || 
    sort !== 'newest'

  const difficultyOptions = ['all', 'easy', 'medium', 'hard']
  const statusOptions = ['all', 'new', 'attempted', 'wrong', 'bookmarked']
  const sortOptions = [
    { value: 'newest', label: 'Newest' },
    { value: 'hardest', label: 'Hardest First' },
    { value: 'most_attempted', label: 'Most Attempted' },
    { value: 'accuracy_asc', label: 'Lowest Accuracy' }
  ]

  const DesktopFilters = () => (
    <div className="flex flex-col gap-4">
      {/* Top Row: Search and Sort */}
      <div className="flex flex-col md:flex-row gap-4 items-center justify-between">
        {/* Search */}
        <div className="relative w-full md:w-80">
          <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-slate-400" />
          <input
            type="text"
            placeholder="Search questions by keyword..."
            value={localSearch}
            onChange={(e) => setLocalSearch(e.target.value)}
            className="w-full pl-9 pr-8 py-2 border border-slate-200 dark:border-slate-700 rounded-lg bg-white dark:bg-slate-900 text-slate-900 dark:text-white text-sm focus:ring-2 focus:ring-indigo-500 focus:border-transparent transition-all"
          />
          {localSearch && (
            <button
              onClick={() => setLocalSearch('')}
              className="absolute right-3 top-1/2 transform -translate-y-1/2 p-0.5 rounded-full hover:bg-slate-100 dark:hover:bg-slate-800 text-slate-400 hover:text-slate-600 dark:hover:text-slate-200"
            >
              <X className="h-3 w-3" />
            </button>
          )}
        </div>

        {/* Sort and Count */}
        <div className="flex items-center gap-4 w-full md:w-auto justify-between md:justify-end">
          <span className="text-xs font-semibold text-slate-500 dark:text-slate-400 bg-slate-100 dark:bg-slate-800 px-3 py-1.5 rounded-full">
            Showing {filteredCount} of {totalCount} questions
          </span>

          <div className="flex items-center gap-2">
            <span className="text-xs font-medium text-slate-500 dark:text-slate-400 whitespace-nowrap">Sort by:</span>
            <select
              value={sort}
              onChange={(e) => onSortChange(e.target.value)}
              className="px-3 py-2 border border-slate-200 dark:border-slate-700 rounded-lg bg-white dark:bg-slate-900 text-slate-900 dark:text-white text-sm focus:ring-2 focus:ring-indigo-500 transition-all cursor-pointer"
            >
              {sortOptions.map(opt => (
                <option key={opt.value} value={opt.value}>{opt.label}</option>
              ))}
            </select>
          </div>
        </div>
      </div>

      {/* Bottom Row: Difficulty & Status Toggles */}
      <div className="flex flex-wrap items-center justify-between gap-4 border-t border-slate-100 dark:border-slate-800/60 pt-4">
        <div className="flex flex-wrap gap-6">
          {/* Difficulty pills */}
          <div className="flex items-center gap-2">
            <span className="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">Difficulty:</span>
            <div className="flex gap-1.5 bg-slate-100 dark:bg-slate-800/60 p-1 rounded-lg">
              {difficultyOptions.map(opt => (
                <button
                  key={opt}
                  onClick={() => onDifficultyChange(opt)}
                  className={`px-3 py-1 rounded-md text-xs font-bold capitalize transition-all ${
                    difficulty === opt
                      ? 'bg-white dark:bg-slate-700 text-indigo-600 dark:text-white shadow-sm'
                      : 'text-slate-500 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-200'
                  }`}
                >
                  {opt}
                </button>
              ))}
            </div>
          </div>

          {/* Status pills */}
          <div className="flex items-center gap-2">
            <span className="text-xs font-semibold text-slate-500 dark:text-slate-400 uppercase tracking-wider">Status:</span>
            <div className="flex gap-1.5 bg-slate-100 dark:bg-slate-800/60 p-1 rounded-lg">
              {statusOptions.map(opt => (
                <button
                  key={opt}
                  onClick={() => onStatusChange(opt)}
                  className={`px-3 py-1 rounded-md text-xs font-bold capitalize transition-all ${
                    status === opt
                      ? 'bg-white dark:bg-slate-700 text-indigo-600 dark:text-white shadow-sm'
                      : 'text-slate-500 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-200'
                  }`}
                >
                  {opt}
                </button>
              ))}
            </div>
          </div>
        </div>

        {/* Clear Filters */}
        {hasActiveFilters && (
          <button
            onClick={onClearFilters}
            className="flex items-center gap-1 text-xs font-semibold text-rose-600 hover:text-rose-700 dark:text-rose-400 dark:hover:text-rose-300 bg-rose-50 dark:bg-rose-950/20 px-3 py-1.5 rounded-lg transition-all border border-rose-100 dark:border-rose-950/40"
          >
            Clear Filters
          </button>
        )}
      </div>
    </div>
  )

  return (
    <div className="bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-xl p-4 shadow-sm">
      {/* Mobile view toggle */}
      <div className="flex lg:hidden justify-between items-center">
        <button
          onClick={() => setIsMobileOpen(!isMobileOpen)}
          className="flex items-center gap-2 px-4 py-2 border border-slate-200 dark:border-slate-700 rounded-lg text-sm font-semibold text-slate-700 dark:text-slate-300 hover:bg-slate-50 dark:hover:bg-slate-700/50"
        >
          <SlidersHorizontal className="h-4 w-4" />
          Filters {hasActiveFilters && '•'}
        </button>
        <span className="text-xs font-semibold text-slate-500 dark:text-slate-400">
          {filteredCount} Questions
        </span>
      </div>

      {/* Desktop Layout */}
      <div className="hidden lg:block">
        <DesktopFilters />
      </div>

      {/* Mobile Drawer/Accordion */}
      {isMobileOpen && (
        <div className="lg:hidden mt-4 pt-4 border-t border-slate-100 dark:border-slate-700 space-y-4">
          {/* Search */}
          <div className="relative">
            <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 h-4 w-4 text-slate-400" />
            <input
              type="text"
              placeholder="Search questions..."
              value={localSearch}
              onChange={(e) => setLocalSearch(e.target.value)}
              className="w-full pl-9 pr-8 py-2 border border-slate-200 dark:border-slate-700 rounded-lg bg-white dark:bg-slate-900 text-slate-900 dark:text-white text-sm focus:ring-2 focus:ring-indigo-500 focus:border-transparent"
            />
            {localSearch && (
              <button onClick={() => setLocalSearch('')} className="absolute right-3 top-1/2 transform -translate-y-1/2 text-slate-400">
                <X className="h-4 w-4" />
              </button>
            )}
          </div>

          {/* Difficulty Selection */}
          <div className="space-y-1.5">
            <span className="text-[10px] font-bold text-slate-400 dark:text-slate-500 uppercase tracking-widest block">Difficulty:</span>
            <div className="flex gap-1.5 bg-slate-100 dark:bg-slate-800 p-1 rounded-lg overflow-x-auto">
              {difficultyOptions.map(opt => (
                <button
                  key={opt}
                  onClick={() => onDifficultyChange(opt)}
                  className={`flex-1 min-w-[4.5rem] px-2 py-1 rounded-md text-xs font-bold capitalize transition-all ${
                    difficulty === opt
                      ? 'bg-white dark:bg-slate-700 text-indigo-600 dark:text-white shadow-sm'
                      : 'text-slate-500 dark:text-slate-400'
                  }`}
                >
                  {opt}
                </button>
              ))}
            </div>
          </div>

          {/* Status Selection */}
          <div className="space-y-1.5">
            <span className="text-[10px] font-bold text-slate-400 dark:text-slate-500 uppercase tracking-widest block">Status:</span>
            <div className="flex gap-1.5 bg-slate-100 dark:bg-slate-800 p-1 rounded-lg overflow-x-auto">
              {statusOptions.map(opt => (
                <button
                  key={opt}
                  onClick={() => onStatusChange(opt)}
                  className={`flex-1 min-w-[5.5rem] px-2 py-1 rounded-md text-xs font-bold capitalize transition-all ${
                    status === opt
                      ? 'bg-white dark:bg-slate-700 text-indigo-600 dark:text-white shadow-sm'
                      : 'text-slate-500 dark:text-slate-400'
                  }`}
                >
                  {opt}
                </button>
              ))}
            </div>
          </div>

          {/* Sort Selection */}
          <div className="flex items-center justify-between gap-4">
            <span className="text-xs font-semibold text-slate-500 dark:text-slate-400">Sort by:</span>
            <select
              value={sort}
              onChange={(e) => onSortChange(e.target.value)}
              className="px-3 py-1.5 border border-slate-200 dark:border-slate-700 rounded-lg bg-white dark:bg-slate-900 text-slate-900 dark:text-white text-sm"
            >
              {sortOptions.map(opt => (
                <option key={opt.value} value={opt.value}>{opt.label}</option>
              ))}
            </select>
          </div>

          {/* Clear Filters */}
          {hasActiveFilters && (
            <button
              onClick={onClearFilters}
              className="w-full py-2 bg-rose-50 dark:bg-rose-950/20 text-rose-600 dark:text-rose-400 text-xs font-bold rounded-lg border border-rose-100 dark:border-rose-950/40"
            >
              Clear Filters
            </button>
          )}
        </div>
      )}
    </div>
  )
}

export default FilterBar
