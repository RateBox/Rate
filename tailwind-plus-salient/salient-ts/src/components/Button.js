"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Button = void 0;
const link_1 = __importDefault(require("next/link"));
const clsx_1 = __importDefault(require("clsx"));
const baseStyles = {
    solid: 'group inline-flex items-center justify-center rounded-full py-2 px-4 text-sm font-semibold focus-visible:outline-2 focus-visible:outline-offset-2',
    outline: 'group inline-flex ring-1 items-center justify-center rounded-full py-2 px-4 text-sm',
};
const variantStyles = {
    solid: {
        slate: 'bg-slate-900 text-white hover:bg-slate-700 hover:text-slate-100 active:bg-slate-800 active:text-slate-300 focus-visible:outline-slate-900',
        blue: 'bg-blue-600 text-white hover:text-slate-100 hover:bg-blue-500 active:bg-blue-800 active:text-blue-100 focus-visible:outline-blue-600',
        white: 'bg-white text-slate-900 hover:bg-blue-50 active:bg-blue-200 active:text-slate-600 focus-visible:outline-white',
    },
    outline: {
        slate: 'ring-slate-200 text-slate-700 hover:text-slate-900 hover:ring-slate-300 active:bg-slate-100 active:text-slate-600 focus-visible:outline-blue-600 focus-visible:ring-slate-300',
        white: 'ring-slate-700 text-white hover:ring-slate-500 active:ring-slate-700 active:text-slate-400 focus-visible:outline-white',
    },
};
function Button({ className, ...props }) {
    props.variant ??= 'solid';
    props.color ??= 'slate';
    className = (0, clsx_1.default)(baseStyles[props.variant], props.variant === 'outline'
        ? variantStyles.outline[props.color]
        : props.variant === 'solid'
            ? variantStyles.solid[props.color]
            : undefined, className);
    return typeof props.href === 'undefined' ? (<button className={className} {...props}/>) : (<link_1.default className={className} {...props}/>);
}
exports.Button = Button;
