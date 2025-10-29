import { useState, useEffect } from 'react';
import { supabase } from '../lib/supabase';

export interface PaymentMethod {
  id: string;
  name: string;
  account_number: string | null;
  account_name: string | null;
  qr_code_url: string | null;
  active: boolean;
  sort_order: number;
  created_at: string;
  updated_at: string;
}

export const usePaymentMethods = () => {
  const [paymentMethods, setPaymentMethods] = useState<PaymentMethod[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const fetchPaymentMethods = async () => {
    try {
      setLoading(true);
      
      const { data, error: fetchError } = await supabase
        .from('payment_methods')
        .select('*')
        .eq('active', true)
        .order('sort_order', { ascending: true });

      if (fetchError) throw fetchError;

      setPaymentMethods(data || []);
      setError(null);
    } catch (err) {
      console.error('Error fetching payment methods:', err);
      setError(err instanceof Error ? err.message : 'Failed to fetch payment methods');
    } finally {
      setLoading(false);
    }
  };

  const fetchAllPaymentMethods = async () => {
    try {
      setLoading(true);
      
      const { data, error: fetchError } = await supabase
        .from('payment_methods')
        .select('*')
        .order('sort_order', { ascending: true });

      if (fetchError) throw fetchError;

      setPaymentMethods(data || []);
      setError(null);
    } catch (err) {
      console.error('Error fetching all payment methods:', err);
      setError(err instanceof Error ? err.message : 'Failed to fetch payment methods');
    } finally {
      setLoading(false);
    }
  };

  const addPaymentMethod = async (method: Omit<PaymentMethod, 'created_at' | 'updated_at'>) => {
    try {
      const { data, error: insertError } = await supabase
        .from('payment_methods')
        .insert({
          id: method.id,
          name: method.name,
          account_number: method.account_number || null,
          account_name: method.account_name || null,
          qr_code_url: method.qr_code_url || null,
          active: method.active,
          sort_order: method.sort_order
        })
        .select()
        .single();

      if (insertError) throw insertError;

      await fetchAllPaymentMethods();
      return data;
    } catch (err) {
      console.error('Error adding payment method:', err);
      throw err;
    }
  };

  const updatePaymentMethod = async (id: string, updates: Partial<PaymentMethod>) => {
    try {
      const { error: updateError } = await supabase
        .from('payment_methods')
        .update({
          name: updates.name,
          account_number: updates.account_number || null,
          account_name: updates.account_name || null,
          qr_code_url: updates.qr_code_url || null,
          active: updates.active,
          sort_order: updates.sort_order
        })
        .eq('id', id);

      if (updateError) throw updateError;

      await fetchAllPaymentMethods();
    } catch (err) {
      console.error('Error updating payment method:', err);
      throw err;
    }
  };

  const deletePaymentMethod = async (id: string) => {
    try {
      const { error: deleteError } = await supabase
        .from('payment_methods')
        .delete()
        .eq('id', id);

      if (deleteError) throw deleteError;

      await fetchAllPaymentMethods();
    } catch (err) {
      console.error('Error deleting payment method:', err);
      throw err;
    }
  };

  const reorderPaymentMethods = async (reorderedMethods: PaymentMethod[]) => {
    try {
      const updates = reorderedMethods.map((method, index) => ({
        id: method.id,
        sort_order: index + 1
      }));

      for (const update of updates) {
        await supabase
          .from('payment_methods')
          .update({ sort_order: update.sort_order })
          .eq('id', update.id);
      }

      await fetchAllPaymentMethods();
    } catch (err) {
      console.error('Error reordering payment methods:', err);
      throw err;
    }
  };

  useEffect(() => {
    fetchPaymentMethods();
  }, []);

  return {
    paymentMethods,
    loading,
    error,
    addPaymentMethod,
    updatePaymentMethod,
    deletePaymentMethod,
    reorderPaymentMethods,
    refetch: fetchPaymentMethods,
    refetchAll: fetchAllPaymentMethods
  };
};