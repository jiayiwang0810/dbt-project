{%- macro get_size(part) -%}

    SUBSTR({{ part }}, 1, CHARINDEX(' ', {{ part }}, 1))

{%- endmacro -%}