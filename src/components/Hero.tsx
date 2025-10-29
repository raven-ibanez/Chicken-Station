import React from 'react';

const Hero: React.FC = () => {
  return (
    <section className="relative bg-gradient-to-br from-red-50 to-white py-16 px-4">
      {/* Checkered Pattern Background */}
      <div className="absolute inset-0 opacity-5">
        <div className="h-full w-full bg-checkered-pattern"></div>
      </div>
      
      <div className="relative max-w-6xl mx-auto text-center">
        {/* Main Hero Content */}
        <div className="bg-white rounded-2xl shadow-2xl p-8 mb-8 border-4 border-red-600">
          <div className="flex items-center justify-center mb-6">
            <div className="w-16 h-16 bg-red-600 rounded-full flex items-center justify-center mr-4">
              <span className="text-white text-3xl">🍗</span>
            </div>
            <div className="text-left">
              <h1 className="text-4xl md:text-5xl font-bold text-red-600 leading-tight">
                CHICKEN STATION
              </h1>
              <p className="text-lg text-gray-600 font-semibold">MENU</p>
            </div>
          </div>
          
          <h2 className="text-3xl md:text-4xl font-bold text-gray-800 mb-4">
            UNLIMITED WINGS
          </h2>
          
          <div className="flex items-center justify-center mb-6">
            <div className="bg-red-600 text-white rounded-full w-24 h-24 flex items-center justify-center shadow-lg">
              <span className="text-2xl font-bold">320</span>
            </div>
          </div>
          
          <div className="text-left max-w-md mx-auto mb-6">
            <h3 className="text-lg font-bold text-red-600 mb-2">INCLUDES:</h3>
            <ul className="text-gray-700 space-y-1">
              <li>• UNLIMITED WINGS</li>
              <li>• UNLIMITED RICE</li>
              <li>• UNLIMITED DRINKS</li>
              <li>• UNLIMITED FRIES</li>
            </ul>
          </div>
          
          <div className="bg-red-100 rounded-lg p-4 mb-6">
            <p className="text-sm text-red-800 font-semibold">
              STRICTLY NO SHARING, NO LEFT OVER, NO TAKE OUT
            </p>
            <p className="text-xs text-red-700 mt-1">
              LEFT OVER WINGS 20 EACH, RICE 10 EACH
            </p>
          </div>
        </div>
        
        {/* Call to Action */}
        <div className="flex justify-center">
          <a 
            href="#menu"
            className="bg-red-600 text-white px-8 py-4 rounded-lg hover:bg-red-700 transition-all duration-300 transform hover:scale-105 font-bold text-lg shadow-lg hover:shadow-xl"
          >
            EXPLORE MENU
          </a>
        </div>
      </div>
    </section>
  );
};

export default Hero;