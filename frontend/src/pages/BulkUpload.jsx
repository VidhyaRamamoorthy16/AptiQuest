import { useState, useRef } from 'react'
import api from '../services/api'
import { useTheme } from '../context/ThemeContext'
import { Upload, Download, FileSpreadsheet, Loader2, CheckCircle2, XCircle, AlertCircle } from 'lucide-react'
import toast from 'react-hot-toast'

const BulkUpload = () => {
  const { darkMode } = useTheme()
  const fileInputRef = useRef(null)
  const [uploading, setUploading] = useState(false)
  const [dragActive, setDragActive] = useState(false)
  const [file, setFile] = useState(null)
  const [uploadResult, setUploadResult] = useState(null)

  const handleDrag = (e) => {
    e.preventDefault()
    e.stopPropagation()
    if (e.type === 'dragenter' || e.type === 'dragover') {
      setDragActive(true)
    } else if (e.type === 'dragleave') {
      setDragActive(false)
    }
  }

  const handleDrop = (e) => {
    e.preventDefault()
    e.stopPropagation()
    setDragActive(false)
    
    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      handleFile(e.dataTransfer.files[0])
    }
  }

  const handleFileSelect = (e) => {
    if (e.target.files && e.target.files[0]) {
      handleFile(e.target.files[0])
    }
  }

  const handleFile = (selectedFile) => {
    const validTypes = [
      'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      'application/vnd.ms-excel',
      'text/csv'
    ]
    
    if (!validTypes.includes(selectedFile.type)) {
      toast.error('Please upload an Excel (.xlsx) or CSV file')
      return
    }
    
    setFile(selectedFile)
    setUploadResult(null)
  }

  const handleUpload = async () => {
    if (!file) return
    
    setUploading(true)
    const formData = new FormData()
    formData.append('file', file)
    
    try {
      const response = await api.post('/questions/bulk-upload', formData, {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      })
      
      setUploadResult(response.data)
      toast.success('Questions uploaded successfully!')
      setFile(null)
      if (fileInputRef.current) {
        fileInputRef.current.value = ''
      }
    } catch (error) {
      console.error('Upload failed:', error)
      toast.error('Failed to upload questions')
      setUploadResult({
        success: false,
        message: error.response?.data?.message || 'Upload failed',
        errors: []
      })
    } finally {
      setUploading(false)
    }
  }

  const downloadTemplate = () => {
    // Create a simple CSV template
    const template = `questionText,topic,difficulty,optionA,optionB,optionC,optionD,correctAnswer,explanation
"What is 15% of 200?",Percentages,Easy,25,30,35,40,A,"To find 15% of 200, multiply 200 by 0.15 = 30"
"If a train travels 120 km in 2 hours, what is its speed?",Time & Distance,Easy,60 km/h,50 km/h,70 km/h,55 km/h,A,"Speed = Distance/Time = 120/2 = 60 km/h"`
    
    const blob = new Blob([template], { type: 'text/csv' })
    const url = window.URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = url
    a.download = 'questions_template.csv'
    document.body.appendChild(a)
    a.click()
    window.URL.revokeObjectURL(url)
    document.body.removeChild(a)
    
    toast.success('Template downloaded successfully')
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h2 className="text-2xl font-bold text-gray-900 dark:text-white">
            Bulk Upload Questions
          </h2>
          <p className="text-gray-600 dark:text-gray-400">
            Upload multiple questions from Excel or CSV files
          </p>
        </div>
        <button
          onClick={downloadTemplate}
          className="flex items-center gap-2 px-4 py-2 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-lg font-medium transition-colors"
        >
          <Download className="h-5 w-5" />
          Download Template
        </button>
      </div>

      {/* Upload Zone */}
      <div
        className={`relative border-2 border-dashed rounded-xl p-12 text-center transition-colors ${
          dragActive
            ? 'border-indigo-500 bg-indigo-50 dark:bg-indigo-900/20'
            : 'border-gray-300 dark:border-gray-600 hover:border-indigo-400 dark:hover:border-indigo-500'
        }`}
        onDragEnter={handleDrag}
        onDragLeave={handleDrag}
        onDragOver={handleDrag}
        onDrop={handleDrop}
      >
        <input
          ref={fileInputRef}
          type="file"
          accept=".xlsx,.xls,.csv"
          onChange={handleFileSelect}
          className="hidden"
          id="file-upload"
        />
        
        {!file ? (
          <>
            <div className="mx-auto mb-4">
              <FileSpreadsheet className="h-16 w-16 text-gray-400 mx-auto" />
            </div>
            <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-2">
              Drop your file here, or click to browse
            </h3>
            <p className="text-gray-600 dark:text-gray-400 mb-4">
              Supports .xlsx, .xls, and .csv files
            </p>
            <label
              htmlFor="file-upload"
              className="inline-flex items-center gap-2 px-6 py-3 bg-indigo-600 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-600 text-white rounded-lg font-medium cursor-pointer transition-colors"
            >
              <Upload className="h-5 w-5" />
              Select File
            </label>
          </>
        ) : (
          <div className="space-y-4">
            <div className="flex items-center justify-center gap-4">
              <FileSpreadsheet className="h-12 w-12 text-indigo-600 dark:text-indigo-400" />
              <div className="text-left">
                <p className="font-medium text-gray-900 dark:text-white">
                  {file.name}
                </p>
                <p className="text-sm text-gray-600 dark:text-gray-400">
                  {(file.size / 1024).toFixed(2)} KB
                </p>
              </div>
              <button
                onClick={() => {
                  setFile(null)
                  setUploadResult(null)
                  if (fileInputRef.current) {
                    fileInputRef.current.value = ''
                  }
                }}
                className="p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 text-gray-600 dark:text-gray-400"
              >
                <XCircle className="h-5 w-5" />
              </button>
            </div>
            
            <button
              onClick={handleUpload}
              disabled={uploading}
              className="inline-flex items-center gap-2 px-6 py-3 bg-indigo-600 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-600 text-white rounded-lg font-medium cursor-pointer transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {uploading ? (
                <>
                  <Loader2 className="h-5 w-5 animate-spin" />
                  Uploading...
                </>
              ) : (
                <>
                  <Upload className="h-5 w-5" />
                  Upload Questions
                </>
              )}
            </button>
          </div>
        )}
      </div>

      {/* Upload Result */}
      {uploadResult && (
        <div className={`rounded-xl border p-6 ${
          uploadResult.success
            ? 'bg-green-50 dark:bg-green-900/20 border-green-200 dark:border-green-800'
            : 'bg-red-50 dark:bg-red-900/20 border-red-200 dark:border-red-800'
        }`}>
          <div className="flex items-start gap-4">
            <div className={`p-2 rounded-full ${
              uploadResult.success
                ? 'bg-green-100 dark:bg-green-900'
                : 'bg-red-100 dark:bg-red-900'
            }`}>
              {uploadResult.success ? (
                <CheckCircle2 className="h-6 w-6 text-green-600 dark:text-green-400" />
              ) : (
                <AlertCircle className="h-6 w-6 text-red-600 dark:text-red-400" />
              )}
            </div>
            
            <div className="flex-1">
              <h3 className={`text-lg font-semibold mb-2 ${
                uploadResult.success
                  ? 'text-green-900 dark:text-green-300'
                  : 'text-red-900 dark:text-red-300'
              }`}>
                {uploadResult.success ? 'Upload Successful!' : 'Upload Failed'}
              </h3>
              
              <p className={`mb-4 ${
                uploadResult.success
                  ? 'text-green-700 dark:text-green-400'
                  : 'text-red-700 dark:text-red-400'
              }`}>
                {uploadResult.message}
              </p>
              
              {uploadResult.success && uploadResult.stats && (
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mt-4">
                  <div className="bg-white dark:bg-gray-800 rounded-lg p-4 border border-green-200 dark:border-green-800">
                    <div className="text-2xl font-bold text-green-600 dark:text-green-400">
                      {uploadResult.stats.total}
                    </div>
                    <div className="text-sm text-gray-600 dark:text-gray-400">
                      Total Questions
                    </div>
                  </div>
                  <div className="bg-white dark:bg-gray-800 rounded-lg p-4 border border-green-200 dark:border-green-800">
                    <div className="text-2xl font-bold text-green-600 dark:text-green-400">
                      {uploadResult.stats.successful}
                    </div>
                    <div className="text-sm text-gray-600 dark:text-gray-400">
                      Successfully Added
                    </div>
                  </div>
                  <div className="bg-white dark:bg-gray-800 rounded-lg p-4 border border-yellow-200 dark:border-yellow-800">
                    <div className="text-2xl font-bold text-yellow-600 dark:text-yellow-400">
                      {uploadResult.stats.updated}
                    </div>
                    <div className="text-sm text-gray-600 dark:text-gray-400">
                      Updated
                    </div>
                  </div>
                  <div className="bg-white dark:bg-gray-800 rounded-lg p-4 border border-red-200 dark:border-red-800">
                    <div className="text-2xl font-bold text-red-600 dark:text-red-400">
                      {uploadResult.stats.failed}
                    </div>
                    <div className="text-sm text-gray-600 dark:text-gray-400">
                      Failed
                    </div>
                  </div>
                </div>
              )}
              
              {uploadResult.errors && uploadResult.errors.length > 0 && (
                <div className="mt-4">
                  <h4 className="font-semibold text-gray-900 dark:text-white mb-2">
                    Errors:
                  </h4>
                  <ul className="space-y-1 text-sm text-gray-600 dark:text-gray-400">
                    {uploadResult.errors.map((error, index) => (
                      <li key={index}>• {error}</li>
                    ))}
                  </ul>
                </div>
              )}
            </div>
          </div>
        </div>
      )}

      {/* Instructions */}
      <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-6 shadow-sm">
        <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-4">
          Upload Instructions
        </h3>
        <div className="space-y-3 text-gray-600 dark:text-gray-400">
          <p>• Download the template to see the required format</p>
          <p>• Ensure your file has the following columns: questionText, topic, difficulty, optionA, optionB, optionC, optionD, correctAnswer, explanation</p>
          <p>• The correctAnswer column should contain only the option letter (A, B, C, or D)</p>
          <p>• Difficulty levels: easy, medium, hard</p>
          <p>• Maximum file size: 10MB</p>
          <p>• Maximum questions per file: 1000</p>
        </div>
      </div>
    </div>
  )
}

export default BulkUpload
