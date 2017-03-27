module Spina
  module Admin
    class InvoicesController < ShopController
      def show
        @invoice = Invoice.find(params[:id])
        presenter = InvoicePresenter.new(@invoice, view_context)
        pdf = InvoicePdf.new(presenter)
        send_data pdf.render, filename: "inv_#{@invoice.invoice_number}.pdf", type: "application/pdf"
      end

      def receipt
        @invoice = Invoice.find(params[:id])
        presenter = InvoicePresenter.new(@invoice, view_context)
        pdf = ReceiptPdf.new(presenter)
        send_data pdf.render, filename: "receipt_#{@invoice.invoice_number}.pdf", type: "application/pdf"
      end
    end
  end
end