import React from 'react';
import { ShoppingCart, Menu } from 'lucide-react';
import { useSiteSettings } from '../hooks/useSiteSettings';

interface HeaderProps {
  cartItemsCount: number;
  onCartClick: () => void;
  onMenuClick: () => void;
}

const Header: React.FC<HeaderProps> = ({ cartItemsCount, onCartClick, onMenuClick }) => {
  const { siteSettings, loading } = useSiteSettings();

  return (
    <header className="sticky top-0 z-50 bg-white shadow-lg border-b-4 border-red-600">
      {/* Checkered Pattern Top Border */}
      <div className="h-2 bg-gradient-to-r from-red-600 via-white to-red-600">
        <div className="h-full bg-checkered-pattern opacity-20"></div>
      </div>
      
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-20">
          {/* Logo and Brand */}
          <button 
            onClick={onMenuClick}
            className="flex items-center space-x-3 text-gray-800 hover:text-red-600 transition-colors duration-200"
          >
            <div className="relative">
              {loading ? (
                <div className="w-12 h-12 bg-gray-200 rounded-full animate-pulse" />
              ) : (
                <div className="w-12 h-12 bg-red-600 rounded-full flex items-center justify-center">
                  <span className="text-white text-xl font-bold">🍗</span>
                </div>
              )}
            </div>
            <div className="text-left">
              <h1 className="text-2xl font-bold text-red-600 leading-tight">
                CHICKEN STATION
              </h1>
              <p className="text-xs text-gray-600 font-medium">MENU</p>
            </div>
          </button>

          {/* Cart Button */}
          <div className="flex items-center space-x-4">
            <button 
              onClick={onCartClick}
              className="relative bg-red-600 text-white px-6 py-3 rounded-lg hover:bg-red-700 transition-all duration-200 font-semibold shadow-lg hover:shadow-xl transform hover:scale-105"
            >
              <div className="flex items-center space-x-2">
                <ShoppingCart className="h-5 w-5" />
                <span>Cart</span>
                {cartItemsCount > 0 && (
                  <span className="bg-white text-red-600 text-xs rounded-full h-5 w-5 flex items-center justify-center font-bold">
                    {cartItemsCount}
                  </span>
                )}
              </div>
            </button>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;