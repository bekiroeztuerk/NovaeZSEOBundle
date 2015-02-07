{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{if is_set( $attribute_base )|not}
    {def $attribute_base = 'ContentObjectAttribute'}
{/if}

{def $metas = ezini('Settings', 'Metas', 'novaseo.ini')}
<div class="block novaseao-metas novaseao-metas-content-edit">
    <div class="">
        <ul>
            {foreach $metas as $key => $meta }
                <li class="meta">
                    <label for="{$attribute_base}_data_novaseometas_{$attribute.contentclass_attribute_identifier}_keyvalue_{$attribute.id}">{$meta.label|wash}</label>
                    <input
                            type="text"
                            id="{$attribute_base}_data_novaseometas_{$attribute.contentclass_attribute_identifier}_keyvalue_{$attribute.id}"
                            name="{$attribute_base}_data_novaseometas_{$attribute.contentclass_attribute_identifier}_keyvalue_{$attribute.id}[{$key|wash}]"
                            value="{if and(is_set($attribute.content.metas),is_set($attribute.content.metas[$key]))}{$attribute.content.metas[$key].content|wash}{/if}"
                            />
                    <div class="break"></div>
                        <ul class="default_values">
                            {if and( is_set($attribute.contentclass_attribute.content),
                                     is_set($attribute.contentclass_attribute.content[$key]),
                                     $attribute.contentclass_attribute.content[$key]|eq('')|not
                            )}
                                <li><label>Field Definition:</label>&nbsp;{$attribute.contentclass_attribute.content[$key]|wash}</li>
                            {/if}
                            {if is_set($meta['default_pattern'])}
                                <li><label>Settings: </label>&nbsp;{$metas[$key].default_pattern|wash}</li>
                            {/if}
                        </ul>
                </li>
            {/foreach}
        </ul>
        {include uri="design:novaseometas_providedby.tpl"}
    </div>
    <div class="break"></div>
</div>
{undef $metas}