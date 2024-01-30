{%- macro clean_date(dt) -%}

    {% if dt | length > 10 %}
        left({{ dt }}, 10)::date
    {% else %}
        {{ dt }}::date
    {% endif %}

{%- endmacro -%}