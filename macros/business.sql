{% macro transaction_type(amount_column) %}
    case
        when {{ amount_column }} < 0 then 'credit'
        when {{ amount_column }} > 0 then 'debit'
        else 'unknown'
    end
{% endmacro %}