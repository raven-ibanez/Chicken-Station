import React from 'react';
import { Trash2, Plus, Minus, ArrowLeft } from 'lucide-react';
import { CartItem } from '../types';

interface CartProps {
  cartItems: CartItem[];
  updateQuantity: (id: string, quantity: number) => void;
  removeFromCart: (id: string) => void;
  clearCart: () => void;
  getTotalPrice: () => number;
  onContinueShopping: () => void;
  onCheckout: () => void;
}

const Cart: React.FC<CartProps> = ({
  cartItems,
  updateQuantity,
  removeFromCart,
  clearCart,
  getTotalPrice,
  onContinueShopping,
  onCheckout
}) => {
  if (cartItems.length === 0) {
    return (
      <div className="max-w-4xl mx-auto px-4 py-12">
        <div className="text-center py-16">
          <div className="text-6xl mb-4">🍗</div>
          <h2 className="text-2xl font-bold text-gray-900 mb-2">YOUR CART IS EMPTY</h2>
          <p className="text-gray-600 mb-6">Add some delicious chicken items to get started!</p>
          <button
            onClick={onContinueShopping}
            className="bg-red-600 text-white px-8 py-4 rounded-lg hover:bg-red-700 transition-all duration-200 font-bold shadow-lg hover:shadow-xl border-2 border-red-700"
          >
            BROWSE MENU
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex items-center justify-between mb-8">
        <button
          onClick={onContinueShopping}
          className="flex items-center space-x-2 text-gray-600 hover:text-red-600 transition-colors duration-200"
        >
          <ArrowLeft className="h-5 w-5" />
          <span>Continue Shopping</span>
        </button>
        <h1 className="text-3xl font-bold text-red-600">YOUR CART</h1>
        <button
          onClick={clearCart}
          className="text-red-500 hover:text-red-600 transition-colors duration-200 font-semibold"
        >
          Clear All
        </button>
      </div>

      <div className="bg-white rounded-xl shadow-lg overflow-hidden mb-8 border-2 border-red-100">
        {cartItems.map((item, index) => (
          <div key={item.id} className={`p-6 ${index !== cartItems.length - 1 ? 'border-b-2 border-red-100' : ''}`}>
            <div className="flex items-center justify-between">
              <div className="flex-1">
                <h3 className="text-lg font-bold text-gray-900 mb-1">{item.name}</h3>
                {item.selectedVariation && (
                  <p className="text-sm text-red-600 mb-1 font-semibold">Size: {item.selectedVariation.name}</p>
                )}
                {item.selectedAddOns && item.selectedAddOns.length > 0 && (
                  <p className="text-sm text-gray-600 mb-1">
                    Add-ons: {item.selectedAddOns.map(addOn => 
                      addOn.quantity && addOn.quantity > 1 
                        ? `${addOn.name} x${addOn.quantity}`
                        : addOn.name
                    ).join(', ')}
                  </p>
                )}
                <p className="text-lg font-bold text-red-600">₱{item.totalPrice} each</p>
              </div>
              
              <div className="flex items-center space-x-4 ml-4">
                <div className="flex items-center space-x-3 bg-red-100 rounded-lg p-2 border-2 border-red-200">
                  <button
                    onClick={() => updateQuantity(item.id, item.quantity - 1)}
                    className="p-2 hover:bg-red-200 rounded-lg transition-colors duration-200 bg-white border border-red-300"
                  >
                    <Minus className="h-4 w-4 text-red-600" />
                  </button>
                  <span className="font-bold text-red-600 min-w-[32px] text-center bg-white px-2 py-1 rounded border border-red-300">{item.quantity}</span>
                  <button
                    onClick={() => updateQuantity(item.id, item.quantity + 1)}
                    className="p-2 hover:bg-red-200 rounded-lg transition-colors duration-200 bg-white border border-red-300"
                  >
                    <Plus className="h-4 w-4 text-red-600" />
                  </button>
                </div>
                
                <div className="text-right">
                  <p className="text-lg font-bold text-red-600">₱{item.totalPrice * item.quantity}</p>
                </div>
                
                <button
                  onClick={() => removeFromCart(item.id)}
                  className="p-2 text-red-500 hover:text-red-600 hover:bg-red-50 rounded-lg transition-all duration-200 border border-red-200"
                >
                  <Trash2 className="h-4 w-4" />
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>

      <div className="bg-white rounded-xl shadow-lg p-6 border-2 border-red-100">
        <div className="flex items-center justify-between text-2xl font-bold text-gray-900 mb-6">
          <span>TOTAL:</span>
          <span className="text-red-600">₱{parseFloat(getTotalPrice() || 0).toFixed(2)}</span>
        </div>
        
        <button
          onClick={onCheckout}
          className="w-full bg-red-600 text-white py-4 rounded-lg hover:bg-red-700 transition-all duration-200 transform hover:scale-[1.02] font-bold text-lg shadow-lg hover:shadow-xl border-2 border-red-700"
        >
          PROCEED TO CHECKOUT
        </button>
      </div>
    </div>
  );
};

export default Cart;