Rails.configuration.stripe = {
  :publishable_key => 'pk_test_ywv3qfGZTSx7yC6L5j2C9v8u',
  :secret_key      => 'sk_test_3wzGWPYQQcBstJh5V8faJnrM'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]