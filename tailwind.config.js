module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/assets/javascripts/**/*.js', // include stimulus controllers!
    './node_modules/grapesjs-tailwind/dist/*.js',
  ],
  safelist: [
    "animate-marquee-horizontal",
    "animate-marquee-horizontal-reverse",
    "animate-marquee-vertical",
    "animate-marquee-vertical-reverse",
    "size-5",
    "size-6",
    "size-7",
    "size-8",
    "size-9",
    "size-10",
    "size-11",
    "size-12",
    "size-13",
    "size-14",
    "size-15",
  ],
  plugins: [],
  theme: {
    extend: {
      keyframes: {
        marqueeHorizontal: {
          "0%": { transform: "translateX(0%)" },
          "100%": { transform: "translateX(-100%)" },
        },
        marqueeHorizontalReverse: {
          "0%": { transform: "translateX(-100%)" },
          "100%": { transform: "translateX(0%)" },
        },
        marqueeVertical: {
          "0%": { transform: "translateY(0%)" },
          "100%": { transform: "translateY(-100%)" },
        },
        marqueeVerticalReverse: {
          "0%": { transform: "translateY(-100%)" },
          "100%": { transform: "translateY(0%)" },
        },
      },
      animation: {
        "marquee-horizontal": "marqueeHorizontal 90s linear infinite",
        "marquee-horizontal-reverse":
          "marqueeHorizontalReverse 90s linear infinite",
        "marquee-vertical": "marqueeVertical 90s linear infinite",
        "marquee-vertical-reverse":
          "marqueeVerticalReverse 90s linear infinite",
      },
    },
  },
}

console.log('/*! ✅ Tailwind config loaded */')
