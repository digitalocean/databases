<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Contacts</title>
        <link rel="stylesheet" href="https://unpkg.com/tachyons@4.10.0/css/tachyons.min.css"/>
    </head>
    <body>
        <div class="mw6 center pa3 sans-serif">
            <h1 class="mb4">Contacts</h1>

            @foreach($contacts as $contact)
            <div class="pa2 mb3 striped--near-white">
                <header class="b mb2">{{ $contact->name }}</header>
                <div class="pl2">
                    <p class="mb2">{{ $contact->phone }}</p>
                    <p class="pre mb3">{{ $contact->address }}</p>
                    <p class="mb2"><span class="fw5">Favorite colors:</span> {{ implode(", ", $contact->favorites['colors']) }}</p>
                </div>
            </div>
            @endforeach
        </div>
    </body>
</html>
