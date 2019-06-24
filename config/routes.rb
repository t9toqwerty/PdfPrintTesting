Rails.application.routes.draw do
  get '/pdf/print', to: 'print_pdf#print'
end
