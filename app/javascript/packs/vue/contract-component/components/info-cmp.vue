<template>
    <div class="ui segment grid">
        <h3>{{ contract.name }}</h3>
        <p>Start Date: 10/21/2018</p>
        <p>End Date: 11/01/2019</p>
        <p>students: {{ contract.students.length }}</p>
    </div>
</template>

<script>
export default {
    name: 'info-component',
    props: ['contract']

}
</script>

<style>

</style>
