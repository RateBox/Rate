"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const server_1 = require("next-intl/server");
const Hero_Old_1 = __importDefault(require("@/components/demo/Hero-Old"));
const Hero_Premium_1 = __importDefault(require("@/components/demo/Hero-Premium"));
const link_1 = __importDefault(require("next/link"));
// Mock data for demo
const mockHeroData = {
    id: 1,
    __component: "sections.hero",
    title: "Transform Your Business with AI",
    subTitle: "Leverage cutting-edge artificial intelligence to streamline operations, boost productivity, and drive unprecedented growth for your business.",
    bgColor: "#ffffff",
    steps: [
        {
            id: 1,
            text: "Automated workflows that save 40+ hours per week"
        },
        {
            id: 2,
            text: "AI-powered insights from your business data"
        },
        {
            id: 3,
            text: "24/7 intelligent customer support"
        },
        {
            id: 4,
            text: "Seamless integration with existing tools"
        }
    ],
    links: [
        {
            id: 1,
            text: "Start Free Trial",
            url: "/signup",
            isExternal: false,
            __component: "ui.link"
        },
        {
            id: 2,
            text: "Watch Demo",
            url: "/demo",
            isExternal: false,
            __component: "ui.link"
        }
    ],
    image: {
        id: 1,
        media: {
            id: 1,
            url: "https://images.unsplash.com/photo-1559136555-9303baea8ebd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
            alternativeText: "AI Dashboard Demo",
            width: 2070,
            height: 1380
        },
        __component: "ui.image"
    }
};
async function DemoPage(props) {
    const params = await props.params;
    (0, server_1.setRequestLocale)(params.locale);
    return (<div className="min-h-screen">
      {/* Header */}
      <div className="bg-gray-50 border-b border-gray-200 py-8">
        <div className="max-w-7xl mx-auto px-6">
          <h1 className="text-3xl font-bold text-gray-900 mb-2">
            Hero Section Comparison
          </h1>
          <p className="text-lg text-gray-600">
            Original vs Tailwind UI Premium Design
          </p>
        </div>
      </div>

      {/* Original Version */}
      <div className="bg-gray-50">
        <div className="max-w-7xl mx-auto px-6 py-8">
          <div className="mb-6">
            <h2 className="text-2xl font-bold text-gray-900 mb-2">
              🟡 Original Version
            </h2>
            <p className="text-gray-600">
              Current implementation using basic Tailwind CSS classes
            </p>
          </div>
          <div className="bg-white rounded-xl shadow-lg overflow-hidden">
            <Hero_Old_1.default component={mockHeroData}/>
          </div>
        </div>
      </div>

      {/* Premium Version */}
      <div className="bg-white">
        <div className="max-w-7xl mx-auto px-6 py-8">
          <div className="mb-6">
            <h2 className="text-2xl font-bold text-gray-900 mb-2">
              ✨ Tailwind UI Premium Version
            </h2>
            <p className="text-gray-600">
              Enhanced with Tailwind UI Premium design patterns, gradients, animations, and advanced components
            </p>
          </div>
          <div className="rounded-xl shadow-lg overflow-hidden">
            <Hero_Premium_1.default component={mockHeroData}/>
          </div>
        </div>
      </div>

      {/* Comparison Summary */}
      <div className="bg-gray-50">
        <div className="max-w-7xl mx-auto px-6 py-12">
          <h2 className="text-2xl font-bold text-gray-900 mb-8 text-center">
            🔍 Key Improvements
          </h2>
          
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div className="bg-white rounded-lg p-6 shadow-lg">
              <div className="flex items-center mb-4">
                <div className="w-8 h-8 bg-blue-100 rounded-lg flex items-center justify-center">
                  🎨
                </div>
                <h3 className="ml-3 text-lg font-semibold text-gray-900">
                  Visual Design
                </h3>
              </div>
              <ul className="space-y-2 text-gray-600">
                <li>• Gradient backgrounds & text</li>
                <li>• Advanced shadows & overlays</li>
                <li>• Rounded corners & modern spacing</li>
                <li>• Background patterns</li>
              </ul>
            </div>

            <div className="bg-white rounded-lg p-6 shadow-lg">
              <div className="flex items-center mb-4">
                <div className="w-8 h-8 bg-green-100 rounded-lg flex items-center justify-center">
                  ⚡
                </div>
                <h3 className="ml-3 text-lg font-semibold text-gray-900">
                  Interactions
                </h3>
              </div>
              <ul className="space-y-2 text-gray-600">
                <li>• Hover animations & transforms</li>
                <li>• Focus states & accessibility</li>
                <li>• Smooth transitions</li>
                <li>• Interactive elements</li>
              </ul>
            </div>

            <div className="bg-white rounded-lg p-6 shadow-lg">
              <div className="flex items-center mb-4">
                <div className="w-8 h-8 bg-purple-100 rounded-lg flex items-center justify-center">
                  🧩
                </div>
                <h3 className="ml-3 text-lg font-semibold text-gray-900">
                  Components
                </h3>
              </div>
              <ul className="space-y-2 text-gray-600">
                <li>• Heroicons integration</li>
                <li>• Trust indicators</li>
                <li>• Floating badges</li>
                <li>• Advanced button variants</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      {/* Catalyst UI Kit Demo */}
      <div className="bg-gradient-to-br from-blue-50 to-indigo-100">
        <div className="max-w-7xl mx-auto px-6 py-12">
          <div className="text-center mb-8">
            <h2 className="text-2xl font-bold text-gray-900 mb-2">
              🚀 Catalyst UI Kit Demo
            </h2>
            <p className="text-gray-600 mb-6">
              Modern React components built with Tailwind CSS from Tailwind Plus ($299)
            </p>
            <link_1.default href="/demo/catalyst" className="inline-flex items-center px-6 py-3 bg-blue-600 text-white font-semibold rounded-lg hover:bg-blue-700 transition-colors">
              View Full Catalyst Demo →
            </link_1.default>
          </div>
          
          <div className="bg-white rounded-xl shadow-lg p-8">
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
              <div className="text-center">
                <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center mx-auto mb-3">
                  🎯
                </div>
                <h3 className="font-semibold text-gray-900 mb-2">27+ Components</h3>
                <p className="text-sm text-gray-600">Button, Input, Dialog, Table, Dropdown...</p>
              </div>
              
              <div className="text-center">
                <div className="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center mx-auto mb-3">
                  ⚡
                </div>
                <h3 className="font-semibold text-gray-900 mb-2">TypeScript</h3>
                <p className="text-sm text-gray-600">Fully typed with excellent IntelliSense</p>
              </div>
              
              <div className="text-center">
                <div className="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center mx-auto mb-3">
                  🎨
                </div>
                <h3 className="font-semibold text-gray-900 mb-2">Accessibility</h3>
                <p className="text-sm text-gray-600">ARIA compliant with Headless UI</p>
              </div>
              
              <div className="text-center">
                <div className="w-12 h-12 bg-amber-100 rounded-lg flex items-center justify-center mx-auto mb-3">
                  🔧
                </div>
                <h3 className="font-semibold text-gray-900 mb-2">Customizable</h3>
                <p className="text-sm text-gray-600">Easy to modify and extend</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>);
}
exports.default = DemoPage;
