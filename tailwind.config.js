module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  safelist: [
    'bg-gray-200',
    'bg-sky-300',
    'bg-orange-300',
    'h-full',
    'overflow-hidden',
    'overflow-y-auto',
    'min-h-screen',
    'h-screen',
    'rounded-full',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
