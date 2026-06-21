import { ChevronLeft, ChevronRight } from 'lucide-react'

const Pagination = ({ page, totalPages, totalItems, onPageChange }) => {
  if (totalPages <= 1) return null

  // Generate page numbers array
  const getPageNumbers = () => {
    const pages = []
    const range = 2 // How many pages to show around current page
    
    // Always show first page
    pages.push(1)

    if (page - range > 2) {
      pages.push('...')
    }

    const start = Math.max(2, page - range)
    const end = Math.min(totalPages - 1, page + range)

    for (let i = start; i <= end; i++) {
      pages.push(i)
    }

    if (page + range < totalPages - 1) {
      pages.push('...')
    }

    // Always show last page
    if (totalPages > 1) {
      pages.push(totalPages)
    }

    return pages
  }

  const pageNumbers = getPageNumbers()

  return (
    <div className="flex flex-col sm:flex-row items-center justify-between gap-4 mt-8 py-4 border-t border-slate-100 dark:border-slate-800">
      {/* Page Info */}
      <span className="text-xs font-semibold text-slate-500 dark:text-slate-400">
        Page {page} of {totalPages} &middot; {totalItems} questions total
      </span>

      {/* Navigator buttons */}
      <div className="flex items-center gap-1.5">
        {/* Prev */}
        <button
          onClick={() => onPageChange(page - 1)}
          disabled={page === 1}
          className="p-2 border border-slate-200 dark:border-slate-700 rounded-lg hover:bg-slate-50 dark:hover:bg-slate-800 text-slate-600 dark:text-slate-300 disabled:opacity-50 disabled:cursor-not-allowed transition-all"
          title="Previous Page"
        >
          <ChevronLeft className="h-4 w-4" />
        </button>

        {/* Numbers */}
        {pageNumbers.map((num, idx) => {
          if (num === '...') {
            return (
              <span key={`dots-${idx}`} className="px-2 text-slate-400 dark:text-slate-600 select-none">
                &hellip;
              </span>
            )
          }

          return (
            <button
              key={`page-${num}`}
              onClick={() => onPageChange(num)}
              className={`min-w-[2.25rem] h-9 flex items-center justify-center rounded-lg text-xs font-bold transition-all border ${
                page === num
                  ? 'bg-indigo-600 border-indigo-600 text-white dark:bg-indigo-500 dark:border-indigo-500 shadow-sm'
                  : 'bg-white border-slate-200 text-slate-600 hover:bg-slate-50 dark:bg-slate-900 dark:border-slate-700 dark:text-slate-300 dark:hover:bg-slate-800'
              }`}
            >
              {num}
            </button>
          )
        })}

        {/* Next */}
        <button
          onClick={() => onPageChange(page + 1)}
          disabled={page === totalPages}
          className="p-2 border border-slate-200 dark:border-slate-700 rounded-lg hover:bg-slate-50 dark:hover:bg-slate-800 text-slate-600 dark:text-slate-300 disabled:opacity-50 disabled:cursor-not-allowed transition-all"
          title="Next Page"
        >
          <ChevronRight className="h-4 w-4" />
        </button>
      </div>
    </div>
  )
}

export default Pagination
