<template>
    <div class="ui grid">
        <div class="row">
            <div class="eleven wide column">
                <div class="ui top attached tabular menu">
                    <a class="item active">
                        Active List
                    </a>
                </div>
                <div class="ui bottom attached active tab segment contract">
                    <info-cmp v-for="(contract,index) in 4"></info-cmp>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import infoCmp from './components/info-cmp.vue';

export default {
    name: 'Contract-Component',
    components: {
        infoCmp
    }
}
</script>