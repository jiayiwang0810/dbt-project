{%- compare_two_dates(date1, date2) -%}

    {% if {{ date1 }} < {{ date2 }} %%}
        TRUE
    {% else %}
        FALSE
    {% endif %}

{%- endmacro -%}