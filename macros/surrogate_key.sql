{% macro surrogate_key(columns) %}

md5(
    concat(
        {% for col in columns %}
            coalesce(cast({{ col }} as varchar), '')
            {% if not loop.last %}, '_' ,{% endif %}
        {% endfor %}
    )
)

{% endmacro %}