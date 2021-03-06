module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    fontFamily: {
      'section': ['Noto Sans JP', 'sans-serif'],
    },
    extends: {
      colors: {
        'primary': '#42AAC7',
        'secondary': '#E6855E',
        'info': '#3DB680',
        'warning': '#F9DB57',
        'danger': '#DA6272',
      }
    },
  },
  plugins: [
    require('@tailwindcss/line-clamp'),
  ]
}
