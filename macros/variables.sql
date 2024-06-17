{% macro learn_variables()  %}

    {%  set your_name_jinja = 'Yash' %}
    {{ log("Hello " ~ your_name_jinja, info=True) }}
    {{ log("Hello DBT User " ~ var("user_name")), info=True  }}


{% endmacro %}