/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./*.html"
  ],
  theme: {
    extend: {
      colors:{
        'myColour': '#0a192f',
        'myColour2':'#64FFDA'
      },
      fontFamily:{
        'display': ['Fira Code']
      }
    
  },
  plugins: [],
}
}