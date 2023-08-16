/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./*.html"
  ],
  theme: {
    extend: {
      fontFamily: {
        'myfont' :['Playfair Display']
      },
      fontSize: {
        sm: '0.8rem',
        base: '1.25rem',
        para:'1.5',
        xl: '1.875rem',
        '2xl': '2.5rem',
        '3xl': '3rem',
        '4xl': '3.75rem',
        '5xl': '4.375rem',
      }
    },
    colors:{
      'colour-1':'#E7F2ED',
      'colour-2':'#F2F2E6',
      'colour-3':"#D0D0A7",
      'colour-4':'#0B8497',
      'colour-5':'#04282D',
      'colour-active':'#0B8497'

    },
    backgroundImage: {
      'architecture': "url('./images/architecture.png')",
      'footer-texture': "url('./images/photography.png')",
    },
  plugins: [],
}
}