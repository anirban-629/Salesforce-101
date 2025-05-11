import { LightningElement, track } from 'lwc';

const helloWorldTranslations = [
    "Hello, World!",               // English
    "Hola, Mundo!",                // Spanish
    "Bonjour, le monde!",          // French
    "Hallo, Welt!",                // German
    "Ciao, Mondo!",                // Italian
    "Olá, Mundo!",                 // Portuguese
    "Привет, мир!",                // Russian
    "こんにちは、世界！",            // Japanese
    "你好，世界！",                 // Chinese (Simplified)
    "안녕하세요, 세계!",             // Korean
    "नमस्ते दुनिया!",             // Hindi
  ];

export default class FirstLightningExample extends LightningElement {
    @track header=helloWorldTranslations[1];
    changeHeader(event){
        const randomTranslation = helloWorldTranslations[Math.floor(Math.random() * helloWorldTranslations.length)];
        this.header=randomTranslation;
    }

    @track visible=true;
    changeButtonColor(event){
        
        this.visible=!this.visible;
    }   

    @track languages1=[
        {
        "language": "English",
        "text": "Hello, World!",
        "background": "#f0f8ff",
        "borderLeftColor": "#0070d2"
    },
    {
        "language": "Spanish",
        "text": "Hola, Mundo!",
        "background": "#fff3e0",
        "borderLeftColor": "#ff9800"
    },
    {
        "language": "French",
        "text": "Bonjour, le monde!",
        "background": "#fce4ec",
        "borderLeftColor": "#e91e63"
    },
    {
        "language": "German",
        "text": "Hallo, Welt!",
        "background": "#e3f2fd",
        "borderLeftColor": "#2196f3"
    },
    {
        "language": "Italian",
        "text": "Ciao, Mondo!",
        "background": "#f1f8e9",
        "borderLeftColor": "#8bc34a"
    },
    ];
    @track languages2=[ 
    {
        "language": "Portuguese",
        "text": "Olá, Mundo!",
        "background": "#e8f5e9",
        "borderLeftColor": "#4caf50"
    },
    {
        "language": "Russian",
        "text": "Привет, мир!",
        "background": "#ede7f6",
        "borderLeftColor": "#673ab7"
    },
    {
    "language": "Japanese",
    "text": "こんにちは、世界！",
    "background": "#fffde7",
    "borderLeftColor": "#fbc02d"
    },
    {
    "language": "Chinese (Simplified)",
    "text": "你好，世界！",
    "background": "#fce4ec",
    "borderLeftColor": "#ec407a"
    },
    {
    "language": "Korean",
    "text": "안녕하세요, 세계!",
    "background": "#ede7f6",
    "borderLeftColor": "#5c6bc0"
    },
    {
    "language": "Hindi",
    "text": "नमस्ते दुनिया!",
    "background": "#e1f5fe",
    "borderLeftColor": "#039be5"
    }
    ]
}